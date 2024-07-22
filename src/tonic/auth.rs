use std::sync::Arc;
use std::task::{Context, Poll};

use futures::future::BoxFuture;
use storage::content_manager::conversions::error_to_status;
use storage::rbac::Access;
use tonic::body::BoxBody;
use tonic::Status;
use tower::{Layer, Service};

use crate::common::auth::{AuthError, AuthKeys};

type Request = tonic::codegen::http::Request<tonic::transport::Body>;
type Response = tonic::codegen::http::Response<BoxBody>;

#[derive(Clone)]
pub struct AuthMiddleware<S> {
    auth_keys: Arc<AuthKeys>,
    service: S,
}

async fn check(auth_keys: Arc<AuthKeys>, mut req: Request) -> Result<Request, Status> {
    let access = auth_keys
        .validate_request(|key| req.headers().get(key).and_then(|val| val.to_str().ok()))
        .await
        .map_err(|e| match e {
            AuthError::Unauthorized(e) => Status::unauthenticated(e),
            AuthError::Forbidden(e) => Status::permission_denied(e),
            AuthError::StorageError(e) => error_to_status(e),
        })?;

    let previous = req.extensions_mut().insert::<Access>(access);
    debug_assert!(
        previous.is_none(),
        "Previous access object should not exist in the request"
    );

    Ok(req)
}

impl<S> Service<Request> for AuthMiddleware<S>
where
    S: Service<Request, Response = Response> + Clone + Send + 'static,
    S::Future: Send + 'static,
{
    type Response = S::Response;
    type Error = S::Error;
    type Future = BoxFuture<'static, Result<Self::Response, S::Error>>;

    fn poll_ready(&mut self, cx: &mut Context<'_>) -> Poll<Result<(), Self::Error>> {
        self.service.poll_ready(cx)
    }

    fn call(&mut self, request: Request) -> Self::Future {
        let auth_keys = self.auth_keys.clone();
        let mut service = self.service.clone();
        Box::pin(async move {
            match check(auth_keys, request).await {
                Ok(req) => service.call(req).await,
                Err(e) => Ok(e.to_http()),
            }
        })
    }
}

#[derive(Clone)]
pub struct AuthLayer {
    auth_keys: Arc<AuthKeys>,
}

impl AuthLayer {
    pub fn new(auth_keys: AuthKeys) -> Self {
        Self {
            auth_keys: Arc::new(auth_keys),
        }
    }
}

impl<S> Layer<S> for AuthLayer {
    type Service = AuthMiddleware<S>;

    fn layer(&self, service: S) -> Self::Service {
        Self::Service {
            auth_keys: self.auth_keys.clone(),
            service,
        }
    }
}

pub fn extract_access<R>(req: &mut tonic::Request<R>) -> Access {
    req.extensions_mut().remove::<Access>().unwrap_or_else(|| {
        Access::full("All requests have full by default access when API key is not configured")
    })
}

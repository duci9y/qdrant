#!/bin/bash

set -ex

glslc tests/test_vector_storage.comp  -o compiled/test_vector_storage_f32.spv  -DVECTOR_STORAGE_ELEMENT_FLOAT32 -O --target-spv=spv1.3 --target-env=vulkan1.2
glslc tests/test_links.comp           -o compiled/test_links_f32.spv           -DVECTOR_STORAGE_ELEMENT_FLOAT32 -O --target-spv=spv1.3 --target-env=vulkan1.2
glslc tests/test_nearest_heap.comp    -o compiled/test_nearest_heap_f32.spv    -DVECTOR_STORAGE_ELEMENT_FLOAT32 -O --target-spv=spv1.3 --target-env=vulkan1.2
glslc tests/test_candidates_heap.comp -o compiled/test_candidates_heap_f32.spv -DVECTOR_STORAGE_ELEMENT_FLOAT32 -O --target-spv=spv1.3 --target-env=vulkan1.2
glslc tests/test_visited_flags.comp   -o compiled/test_visited_flags_f32.spv   -DVECTOR_STORAGE_ELEMENT_FLOAT32 -O --target-spv=spv1.3 --target-env=vulkan1.2
glslc tests/test_hnsw_search.comp     -o compiled/test_hnsw_search_f32.spv     -DVECTOR_STORAGE_ELEMENT_FLOAT32 -O --target-spv=spv1.3 --target-env=vulkan1.2
glslc tests/test_heuristic.comp       -o compiled/test_heuristic_f32.spv       -DVECTOR_STORAGE_ELEMENT_FLOAT32 -O --target-spv=spv1.3 --target-env=vulkan1.2
glslc run_greedy_search.comp          -o compiled/run_greedy_search_f32.spv    -DVECTOR_STORAGE_ELEMENT_FLOAT32 -O --target-spv=spv1.3 --target-env=vulkan1.2
glslc run_insert_vector.comp          -o compiled/run_insert_vector_f32.spv    -DVECTOR_STORAGE_ELEMENT_FLOAT32 -O --target-spv=spv1.3 --target-env=vulkan1.2

glslc tests/test_vector_storage.comp  -o compiled/test_vector_storage_f16.spv  -DVECTOR_STORAGE_ELEMENT_FLOAT16 -O --target-spv=spv1.3 --target-env=vulkan1.2
glslc tests/test_links.comp           -o compiled/test_links_f16.spv           -DVECTOR_STORAGE_ELEMENT_FLOAT16 -O --target-spv=spv1.3 --target-env=vulkan1.2
glslc tests/test_nearest_heap.comp    -o compiled/test_nearest_heap_f16.spv    -DVECTOR_STORAGE_ELEMENT_FLOAT16 -O --target-spv=spv1.3 --target-env=vulkan1.2
glslc tests/test_candidates_heap.comp -o compiled/test_candidates_heap_f16.spv -DVECTOR_STORAGE_ELEMENT_FLOAT16 -O --target-spv=spv1.3 --target-env=vulkan1.2
glslc tests/test_visited_flags.comp   -o compiled/test_visited_flags_f16.spv   -DVECTOR_STORAGE_ELEMENT_FLOAT16 -O --target-spv=spv1.3 --target-env=vulkan1.2
glslc tests/test_hnsw_search.comp     -o compiled/test_hnsw_search_f16.spv     -DVECTOR_STORAGE_ELEMENT_FLOAT16 -O --target-spv=spv1.3 --target-env=vulkan1.2
glslc tests/test_heuristic.comp       -o compiled/test_heuristic_f16.spv       -DVECTOR_STORAGE_ELEMENT_FLOAT16 -O --target-spv=spv1.3 --target-env=vulkan1.2
glslc run_greedy_search.comp          -o compiled/run_greedy_search_f16.spv    -DVECTOR_STORAGE_ELEMENT_FLOAT16 -O --target-spv=spv1.3 --target-env=vulkan1.2
glslc run_insert_vector.comp          -o compiled/run_insert_vector_f16.spv    -DVECTOR_STORAGE_ELEMENT_FLOAT16 -O --target-spv=spv1.3 --target-env=vulkan1.2

glslc tests/test_vector_storage.comp  -o compiled/test_vector_storage_u8.spv  -DVECTOR_STORAGE_ELEMENT_UINT8 -O --target-spv=spv1.3 --target-env=vulkan1.2
glslc tests/test_links.comp           -o compiled/test_links_u8.spv           -DVECTOR_STORAGE_ELEMENT_UINT8 -O --target-spv=spv1.3 --target-env=vulkan1.2
glslc tests/test_nearest_heap.comp    -o compiled/test_nearest_heap_u8.spv    -DVECTOR_STORAGE_ELEMENT_UINT8 -O --target-spv=spv1.3 --target-env=vulkan1.2
glslc tests/test_candidates_heap.comp -o compiled/test_candidates_heap_u8.spv -DVECTOR_STORAGE_ELEMENT_UINT8 -O --target-spv=spv1.3 --target-env=vulkan1.2
glslc tests/test_visited_flags.comp   -o compiled/test_visited_flags_u8.spv   -DVECTOR_STORAGE_ELEMENT_UINT8 -O --target-spv=spv1.3 --target-env=vulkan1.2
glslc tests/test_hnsw_search.comp     -o compiled/test_hnsw_search_u8.spv     -DVECTOR_STORAGE_ELEMENT_UINT8 -O --target-spv=spv1.3 --target-env=vulkan1.2
glslc tests/test_heuristic.comp       -o compiled/test_heuristic_u8.spv       -DVECTOR_STORAGE_ELEMENT_UINT8 -O --target-spv=spv1.3 --target-env=vulkan1.2
glslc run_greedy_search.comp          -o compiled/run_greedy_search_u8.spv    -DVECTOR_STORAGE_ELEMENT_UINT8 -O --target-spv=spv1.3 --target-env=vulkan1.2
glslc run_insert_vector.comp          -o compiled/run_insert_vector_u8.spv    -DVECTOR_STORAGE_ELEMENT_UINT8 -O --target-spv=spv1.3 --target-env=vulkan1.2

glslc tests/test_vector_storage.comp  -o compiled/test_vector_storage_binary.spv  -DVECTOR_STORAGE_ELEMENT_BINARY -O --target-spv=spv1.3 --target-env=vulkan1.2
glslc tests/test_links.comp           -o compiled/test_links_binary.spv           -DVECTOR_STORAGE_ELEMENT_BINARY -O --target-spv=spv1.3 --target-env=vulkan1.2
glslc tests/test_nearest_heap.comp    -o compiled/test_nearest_heap_binary.spv    -DVECTOR_STORAGE_ELEMENT_BINARY -O --target-spv=spv1.3 --target-env=vulkan1.2
glslc tests/test_candidates_heap.comp -o compiled/test_candidates_heap_binary.spv -DVECTOR_STORAGE_ELEMENT_BINARY -O --target-spv=spv1.3 --target-env=vulkan1.2
glslc tests/test_visited_flags.comp   -o compiled/test_visited_flags_binary.spv   -DVECTOR_STORAGE_ELEMENT_BINARY -O --target-spv=spv1.3 --target-env=vulkan1.2
glslc tests/test_hnsw_search.comp     -o compiled/test_hnsw_search_binary.spv     -DVECTOR_STORAGE_ELEMENT_BINARY -O --target-spv=spv1.3 --target-env=vulkan1.2
glslc tests/test_heuristic.comp       -o compiled/test_heuristic_binary.spv       -DVECTOR_STORAGE_ELEMENT_BINARY -O --target-spv=spv1.3 --target-env=vulkan1.2
glslc run_greedy_search.comp          -o compiled/run_greedy_search_binary.spv    -DVECTOR_STORAGE_ELEMENT_BINARY -O --target-spv=spv1.3 --target-env=vulkan1.2
glslc run_insert_vector.comp          -o compiled/run_insert_vector_binary.spv    -DVECTOR_STORAGE_ELEMENT_BINARY -O --target-spv=spv1.3 --target-env=vulkan1.2

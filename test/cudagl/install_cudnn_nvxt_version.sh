#!/bin/bash

set -e

# Optional: Import test library
source dev-container-features-test-lib

# Check installation of libcudnn8 (8.9.6)
check "libcudnn.so.8.9.6" test 1 -eq "$(find /usr -name 'libcudnn.so.8.9.6' | wc -l)"

# Check installation of cuda-nvtx-12-2 (11.5)
check "cuda-11-5+nvtx" test -e '/usr/local/cuda-12.2/targets/x86_64-linux/include/nvtx3'

# Report result
reportResults
    
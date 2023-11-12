#!/bin/bash

set -e

# Optional: Import test library
source dev-container-features-test-lib

check "cuda version" test -d /usr/local/cuda-12.2

# Check installation of cuda-libraries-11-<version>
check "libcudart.so.12" test 1 -eq "$(find /usr -name 'libcudart.so.12' | wc -l)"
check "libcublas.so.12" test 1 -eq "$(find /usr -name 'libcublas.so.12' | wc -l)"
check "libcublasLt.so.12" test 1 -eq "$(find /usr -name 'libcublasLt.so.12' | wc -l)"
check "libcufft.so.11" test 1 -eq "$(find /usr -name 'libcufft.so.11' | wc -l)"
check "libcurand.so.10" test 1 -eq "$(find /usr -name 'libcurand.so.10' | wc -l)"
check "libcusolver.so.11" test 1 -eq "$(find /usr -name 'libcusolver.so.11' | wc -l)"
check "libcusparse.so.12" test 1 -eq "$(find /usr -name 'libcusparse.so.12' | wc -l)"

# Check installation of OpenGL libraries
check "libOpenGL.so" test 1 -eq "$(find /usr -name 'libOpenGL.so' | wc -l)"
check "libGL.so" test 1 -eq "$(find /usr -name 'libGL.so' | wc -l)"
check "libGLdispatch.so" test 1 -eq "$(find /usr -name 'libGLdispatch.so' | wc -l)"
check "libGLdispatch.so.0" test 1 -eq "$(find /usr -name 'libGLdispatch.so.0' | wc -l)"
check "libGLX.so" test 1 -eq "$(find /usr -name 'libGLX.so' | wc -l)"
check "libGLX_mesa.so.0" test 1 -eq "$(find /usr -name 'libGLX_mesa.so.0' | wc -l)"

# Report result
reportResults
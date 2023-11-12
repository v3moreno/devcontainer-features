#!/bin/bash

set -e

source dev-container-features-test-lib

ZIG_VERSION=$(zig version)

check "zig version" zig version | grep $ZIG_VERSION
check "zls --version" zls --version | grep $ZIG_VERSION

reportResults
#!/bin/bash

set -e

source dev-container-features-test-lib

INDEX_URL="https://ziglang.org/download/index.json"
ZIG_VERSION=$(curl -sSL $INDEX_URL | jq -r 'to_entries[0].value.version')
ZLS_VERSION=$(cut -d'-' -f1 <<< $ZIG_VERSION)-dev

check "zig version" zig version | grep $ZIG_VERSION
check "zls --version" zls --version | grep $ZLS_VERSION

reportResults
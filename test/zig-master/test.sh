#!/bin/bash

set -e

source dev-container-features-test-lib

INDEX_URL="https://ziglang.org/download/index.json"
ZIG_VERSION=$(curl -sSL $INDEX_URL | jq -r 'to_entries[0].value.version')

check "zig version" zig version | grep $ZIG_VERSION

reportResults
#!/usr/bin/env bash

ZLS_VERSION="${VERSION:-"0.11.0"}"

set -e

if [ "$(id -u)" -ne 0 ]; then
	echo -e 'Script must be run as root. Use sudo, su, or add "USER root" to your Dockerfile before running this script.'
	exit 1
fi

# Clean up
rm -rf /var/lib/apt/lists/*

# Checks if packages are installed and installs them if not
check_packages() {
	if ! dpkg -s "$@" >/dev/null 2>&1; then
		if [ "$(find /var/lib/apt/lists/* | wc -l)" = "0" ]; then
			echo "Running apt-get update..."
			apt-get update -y
		fi
		apt-get -y install --no-install-recommends "$@"
	fi
}

# make sure we have wget
check_packages ca-certificates wget jq

# remove existing instalations
rm -rf /usr/local/lib/zls

# make sure /usr/local/lib/zig exists
mkdir -p /usr/local/lib/zls

# Specify source file to download
DOWNLOAD_URL="https://github.com/zigtools/zls/releases/download/$ZLS_VERSION/zls-x86_64-linux.tar.gz"

# download binary, untar and ln into /usr/local/bin
wget $DOWNLOAD_URL
tar -x --strip-components=1 -f zls-x86_64-linux.tar.gz -C /usr/local/lib/zls
chmod +x /usr/local/lib/zls/bin/zls
ln -s /usr/local/lib/zls/bin/zls /usr/local/bin/zls

# Clean up
rm -rf zls-x86_64-linux.tar.gz
rm -rf /var/lib/apt/lists/*

echo "Done!"

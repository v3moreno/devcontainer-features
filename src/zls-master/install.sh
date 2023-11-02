#!/usr/bin/env bash

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
check_packages git

# remove existing instalations
rm -rf /usr/local/lib/zls

# make sure /usr/local/lib/zig exists
mkdir -p /usr/local/lib/zls

# Clone zls master repo and build zls, a build of Zig master is required.
git clone https://github.com/zigtools/zls
cd zls
zig build -Doptimize=ReleaseSafe
mv zig-out/bin/zls /usr/local/lib/zls/zls
chmod +x /usr/local/lib/zls/zls
ln -s /usr/local/lib/zls/zls /usr/local/bin/zls

# Clean up
cd ..
rm -rf zls/
rm -rf /var/lib/apt/lists/*

echo "Done!"
#!/bin/bash
set -e
USER_AGENT="WireGuard-AndroidROMBuild/0.1 ($(uname -a))"

#[[ $(( $(date +%s) - $(stat -c %Y "net/wireguard/.check" 2>/dev/null || echo 0) )) -gt 86400 ]] || exit 0

[[ $(curl -A "$USER_AGENT" -LSs https://git.zx2c4.com/wireguard-linux-compat/refs/) =~ snapshot/wireguard-linux-compat-([0-9.]+)\.tar\.xz ]]

#if [[ -f net/wireguard/version.h && $(< net/wireguard/version.h) == *${BASH_REMATCH[1]}* ]]; then
#	touch net/wireguard/.check
#	exit 0
#fi

rm -rf net/wireguard
mkdir -p net/wireguard
curl -A "$USER_AGENT" -LsS "https://git.zx2c4.com/wireguard-linux-compat/snapshot/wireguard-linux-compat-${BASH_REMATCH[1]}.tar.xz" | tar -v -C "net/wireguard" -xJf - --strip-components=2 "wireguard-linux-compat-${BASH_REMATCH[1]}/src"
WIREGUARD_VERSION="Imported WireGuard-linux-compat: ${BASH_REMATCH[1]}"

#[[ $(curl -A "$USER_AGENT" -LSs https://git.zx2c4.com/wireguard-tools/refs/) =~ snapshot/wireguard-tools-([0-9.]+)\.tar\.xz ]]
##curl -A "$USER_AGENT" -LsS "https://git.zx2c4.com/wireguard-tools/snapshot/wireguard-tools-${BASH_REMATCH[1]}.tar.xz" | tar -v -C "net/wireguard" -xJf - --strip-components=2 "wireguard-tools-${BASH_REMATCH[1]}/src"
sed -i 's/tristate/bool/;s/default m/default y/;' net/wireguard/Kconfig
touch net/wireguard/.check
WIREGUARD_TOOLS_VERSION="Imported WireGuard-Tools: ${BASH_REMATCH[1]}"
#echo $WIREGUARD_VERSION $WIREGUARD_TOOLS_VERSION
echo $WIREGUARD_VERSION

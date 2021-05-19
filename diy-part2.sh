#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.1.254/g' package/base-files/files/bin/config_generate

pushd package/lean
git clone --depth=1 https://github.com/fw876/helloworld
popd

mkdir package/community
pushd package/community

git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall

git clone --depth=1 https://github.com/Lienol/openwrt-package
git clone --depth=1 -b master https://github.com/vernesong/OpenClash

git clone --depth=1 https://github.com/SuLingGG/luci-app-diskman
mkdir parted
cp luci-app-diskman/Parted.Makefile parted/Makefile

#!/bin/bash
set -e

cd $(dirname $0)

rm -rf ./WALinuxAgent.tar.gz

wget https://codeload.github.com/Azure/WALinuxAgent/tar.gz/v2.7.3.0 -O WALinuxAgent.tar.gz

#!/usr/bin/env bash
#---------------------------------------------------------------------------
# Copyright 2011-2012 The Open Source Electronic Health Record Agent
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#---------------------------------------------------------------------------

# Install GT.M using gtminstall script
# This utility requires root privliges

# Make sure we are root
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root" 1>&2
    exit 1
fi

# Download gtminstall script from SourceForge
# TODO: kill output
# TODO: log status
# TODO; determine if this needs to be logged
wget http://downloads.sourceforge.net/project/fis-gtm/GT.M%20Installer/v0.12/gtminstall

# Verify hash as we are going to make it executable
# TODO: get hash and compare
sha1sum -c --status gtminstall_SHA1
if [ $? -gt 0 ]; then
    echo "Something went wrong downloading gtminstall"
    exit $?
fi

# Get kernel.shmmax to determine if we can use 32k strings
shmmax=$(sysctl -n kernel.shmmax)

if [ $shmmax -ge 67108864 ]; then
    echo "Current shared memory maximum is equal to or greater than 64MB"
    echo "Current shmmax is: " $shmmax
else
    echo "Current shared memory maximum is less than 64MB"
    echo "Current shmmax is: " $shmmax
    echo "Setting shared memory maximum to 64MB"
    echo "kernel.shmmax = 67108864" >> /etc/sysctl.conf
    sysctl -w kernel.shmmax=67108864
fi

# Make it executable
chmod +x gtminstall

gtm_ver=V6.0-002

# Determine processor architecture - used to determine if we can use GT.M
#                                    Shared Libraries
# Default to x86 (32bit) - algorithm similar to gtminstall script
arch=$(uname -m | tr -d _)
if [ $arch == "x8664" ]; then
    gtm_arch="x86_64"
else
    gtm_arch="x86"
fi

# Accept most defaults for gtminstall
# --ucaseonly-utils - override default to install only uppercase utilities
#                     this follows VistA convention of uppercase only routines
./gtminstall --ucaseonly-utils --installdir /opt/lsb-gtm/"$gtm_ver"_"$gtm_arch" $gtm_ver
# remove installgtm script as it is unnecessary
rm ./gtminstall

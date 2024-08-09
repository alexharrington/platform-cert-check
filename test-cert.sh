#!/bin/bash

#
# test-cert.sh
# Check if a given certificate and chain will be compatible with various
# platforms - particularly older Android versions
#
# Copyright (C) 2024 Alexander Harrington
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

if ! command -v openssl &> /dev/null
then
    echo "openssl not found. Please ensure openssl is in your path"
    exit 1
fi

if [ $# -ne 2 ];
then
    echo "Missing parameters. $0 certificate all"
    echo "all can be substituted for a specific platform if you wish."
    echo "certificate.crt and the chain for the certificate must be at certificate.chain.crt"
    exit 1
fi

if [ ! -f $1.crt ]
then
    echo "$1.crt not found"
    exit 1
fi

if [ ! -f $1.chain.crt ]
then
    echo "$1.chain.crt not found"
    exit 1
fi

declare -a platforms

if [ $2 == all ]
then
    i=1
    for d in cacerts/*
    do
        platforms[i++]="${d%/}"
    done
else
    if [ ! -f cacerts/$2/ca-certificates.crt ]
    then
        echo "platform not found. Check cacerts/$2/ca-certificates.crt exists"
        exit 1
    fi
    i=1
    platforms[i++]=cacerts/$2
fi

for((i=1;i<=${#platforms[@]};i++))
do
    echo
    echo "Testing ${platforms[i]}"
    openssl verify -no-CApath -no-CAfile -no-CAstore -CAfile ${platforms[i]}/ca-certificates.crt -show_chain -untrusted $1.chain.crt $1.crt
done

    
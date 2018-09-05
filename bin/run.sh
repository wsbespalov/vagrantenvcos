#!/bin/bash

echo "*********************************************************************************************"

BINDIR="$(cd "$(dirname "${0}")" && pwd -P)"
BASEDIR="$(dirname "${BINDIR}")"

cd "${BASEDIR}"

test -f "default.environment" && source "default.environment"

test -f vagrantfile && vagrant up

echo "*********************************************************************************************"
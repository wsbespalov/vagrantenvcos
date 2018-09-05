#!/bin/bash

echo "*********************************************************************************************"

BINDIR="$(cd "$(dirname "${0}")" && pwd -P)"
BASEDIR="$(dirname "${BINDIR}")"

cd "${BASEDIR}/fixtures"

test -f "load_cache_fixtures.rb" && ruby load_cache_fixtures.rb

echo "*********************************************************************************************"
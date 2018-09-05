#!/bin/bash

echo "*********************************************************************************************"

BINDIR="$(cd "$(dirname "${0}")" && pwd -P)"
BASEDIR="$(dirname "${BINDIR}")"

cd "${BASEDIR}/fixtures"

test -f "load_db_fixtures.rb" && ruby load_db_fixtures.rb

echo "*********************************************************************************************"
#!/bin/bash -e

BINDIR="$(cd "$(dirname "${0}")" && pwd -P)"
BASEDIR="$(dirname "${BINDIR}")"
shift || true

cd "${BASEDIR}"

test -f "../app.environment" && source "../app.environment"

cd "${BASEDIR}/src/toos-simulator"

test -f "default.environment" && source "default.environment"
test -f "local.environment" && source "local.environment"

echo "Run ./bin/run.sh"

if [ -e "./bin/run.sh" ]; then
	./bin/run.sh
else
	echo "./bin/run.sh does not exists. Nothing to run."
fi
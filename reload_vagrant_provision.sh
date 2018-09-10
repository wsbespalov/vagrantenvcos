#!/bin/bash -e
BASEDIR="$(cd "$(dirname "${0}")" && pwd -P)"

shift || true

cd "${BASEDIR}"

echo "Load Vagrant environment..."

if [ -e "start.environment" ]; then
	source "start.environment"
else
	echo "start.environment does not exists. Nothing env. to load."
fi

echo "Reload Vagrant containers (--provision)..."

if [ -e "Vagrantfile" ]; then
	vagrant reload --provision
else
	echo "Vagrant file does not exists"
fi
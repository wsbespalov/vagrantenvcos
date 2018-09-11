#!/bin/bash -e
BASEDIR="$(cd "$(dirname "${0}")" && pwd -P)"

shift || true

cd "${BASEDIR}"

echo "*** "
echo "*** Load Repositories..."
echo "*** "

cos_api_repository="https://gitlab.brain-candy.net/COS/cos-api.git"
cos_simulator_repository="https://gitlab.brain-candy.net/COS/toos-simulator.git"
cos_billing_repository="https://gitlab.brain-candy.net/COS/cos-billing.git"
cos_onboarding_repository="https://gitlab.brain-candy.net/COS/cos-onboarding.git"
cos_tablet_repository="https://gitlab.brain-candy.net/COS/cos-tablet.git"

cos_api_branch="master"
cos_simulator_branch="master"
cos_billing_branch="master"
cos_onboarding_branch="master"
cos_tablet_branch="master"

echo "*** Process project repositories"

if [ -d "src" ]; then
	echo "* Folder src exists"
	cd src
else
	echo "* Folder src does not exists"
	echo "* Create src folder"
	mkdir src
	cd src
fi

echo "*** Processing cos-api project"

# if [ -d "cos-api" ]; then
# 	echo "* API project already exists"
# 	echo "* Go to API project folder"
# 	cd cos-api
# 	echo "* Make git pull"
# 	git pull origin $cos_api_branch
# 	echo "* Return to src folder"
# 	cd ../
# else
# 	echo "* API project not exists"
# 	echo "* Clone cos-api"
# 	git clone $cos_api_repository
# 	echo "* Go to API project folder"
# 	cd cos-api
# 	echo "* Repository branches are"
# 	git branch
# 	echo "* Checkout work branch"
# 	git checkout $cos_api_branch
# 	echo "* Return to src folder"
# 	cd ../
# fi

# echo "*** Processing toos-simulator project"

# if [ -d "toos-simulator" ]; then
# 	echo "* Simulator project already exists"
# 	echo "* Go to Simulator project folder"
# 	cd toos-simulator
# 	echo "* Make git pull"
# 	git pull origin $cos_simulator_branch
# 	echo "* Return to src folder"
# 	cd ../
# else
# 	echo "* Simulator project not exists"
# 	echo "* Clone toos-simulator"
# 	git clone $cos_simulator_repository
# 	echo "* Go to Simulator project folder"
# 	cd toos-simulator
# 	echo "* Repository branches are"
# 	git branch
# 	echo "* Checkout work branch"
# 	git checkout $cos_simulator_branch
# 	echo "* Return to src folder"
# 	cd ../
# fi

# echo "*** Processing cos-billing project"

# if [ -d "cos-billing" ]; then
# 	echo "* Billing project already exists"
# 	echo "* Go to Billing project folder"
# 	cd cos-billing
# 	echo "* Make git pull"
# 	git pull origin $cos_billing_branch
# 	echo "* Return to src folder"
# 	cd ../
# else
# 	echo "* Billing project not exists"
# 	echo "* Clone cos-billing"
# 	git clone $cos_billing_repository
# 	echo "* Go to Billing project folder"
# 	cd cos-billing
# 	echo "* Repository branches are"
# 	git branch
# 	echo "* Checkout work branch"
# 	git checkout $cos_billing_branch
# 	echo "* Return to src folder"
# 	cd ../
# fi

# echo "*** Processing cos-onboarding project"

# if [ -d "cos-onboarding" ]; then
# 	echo "* Onboarding project already exists"
# 	echo "* Go to Onboarding project folder"
# 	cd cos-onboarding
# 	echo "* Make git pull"
# 	git pull origin $cos_onboarding_branch
# 	echo "* Return to src folder"
# 	cd ../
# else
# 	echo "* Onboarding project not exists"
# 	echo "* Clone cos-onboarding"
# 	git clone $cos_onboarding_repository
# 	echo "* Go to Onboarding project folder"
# 	cd cos-onboarding
# 	echo "* Repository branches are"
# 	git branch
# 	echo "* Checkout work branch"
# 	git checkout $cos_onboarding_branch
# 	echo "* Return to src folder"
# 	cd ../
# fi

# echo "*** Processing cos-tablet project"

# if [ -d "cos-tablet" ]; then
# 	echo "* Tablet project already exists"
# 	echo "* Go to Tablet project folder"
# 	cd cos-tablet
# 	echo "* Make git pull"
# 	git pull origin $cos_tablet_branch
# 	echo "* Return to src folder"
# 	cd ../
# else
# 	echo "* Tablet project not exists"
# 	echo "* Clone cos-tablet"
# 	git clone $cos_tablet_repository
# 	echo "* Go to Tablet project folder"
# 	cd cos-tablet
# 	echo "* Repository branches are"
# 	git branch
# 	echo "* Checkout work branch"
# 	git checkout $cos_tablet_branch
# 	echo "* Return to src folder"
# 	cd ../
# fi

echo "* Return to main folder"

cd ../

echo "*** "
echo "*** Load Vagrant environment..."
echo "*** "

if [ -e "start.environment" ]; then
	source "start.environment"
else
	echo "start.environment does not exists. Nothing env. to load."
fi

echo "Start Vagrant containers..."

if [ -e "Vagrantfile" ]; then
	vagrant up
else
	echo "Vagrant file does not exists"
fi
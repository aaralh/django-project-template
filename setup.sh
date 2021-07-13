#!/bin/bash
set -e

if [ -z "$1" ]
  then
    echo "No project name were supplied!"
    echo -e "\t ./setup.sh <project_name>"
    exit 1
fi

SUFFIX="-env"
ENV=$1$SUFFIX

echo "Initializing Python environment:"
echo "python3 -m venv $ENV"
python3 -m venv $ENV

echo "Activating virtual environment:"
echo "source $ENV/bin/activate"
source $ENV/bin/activate

echo "Installing dependencies:"
echo "pip install -r requirements.txt"
pip install -r requirements.txt

DIR=".git"
if [ -d "$DIR" ]; then
    echo "Removing current git connection:"
    echo "rm -r .git/"
    rm -rf .git/
fi

echo "Initializing new git repository:"
echo "git init"
git init

echo "Creating new Django project '$1':"
echo "django-admin startproject $1"
django-admin startproject $1

echo "Tweaking the files:"
awk '$0 == "# SECURITY WARNING: keep the secret key used in production secret!" {i=1;next}; i && i++ < 2' ./$1/$1/settings.py | tr -d '[:space:]' >> .env
mkdir tmp_files
mv $1/* tmp_files && rm -r $1
mv tmp_files/* . && rm -r tmp_files

sed -e "s/{PROJECT_NAME}/$1/g" settings.template > $1/settings.py
sed -e "s/{PROJECT_NAME}/$1/g" mypy.template > mypy.ini
mv env.template .env
echo -e "$ENV/" >> .gitignore
rm settings.template
rm mypy.template

echo "Initialization succeeded!"
echo "Start the python env by running: source $ENV/bin/activate"
echo "Start the docker container by running: docker-compose up -d"


#!/bin/sh

set -e

[ -z "${GITHUB_PAT}" ] && exit 0
[ "${TRAVIS_BRANCH}" != "master" ] && exit 0

git config --global user.email "epongpipat@gmail.com"
git config --global user.name "Ekarin Eric Pongpipat"

git clone -b gh-pages https://github.com/epongpipat/epongpipat.github.io.git book-practical-ext-of-intro-stats-in-psy-using-R
cd book-practical-ext-of-intro-stats-in-psy-using-R
cp -r ../_book/* ./
git add --all *
git commit -m"Update the book" || true
git push -q origin gh-pages

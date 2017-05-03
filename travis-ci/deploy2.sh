#!/bin/bash
YEAR=$(date +"%Y")
MONTH=$(date +"%m")
cd $TRAVIS_BUILD_DIR
#git clone --depth=50 --branch=master https://github.com/mitchellkrogza/Travis-CI-Nginx-for-Testing-Nginx-Configuration.git mitchellkrogza/Travis-CI-Nginx-for-Testing-Nginx-Configuration
#git reset --hard $sha1
git checkout master
git config --global user.email "${GIT_EMAIL}"
git config --global user.name "${GIT_NAME}"
git config --global push.default simple
#git fetch origin master
#git diff origin/master
#git branch
#git checkout $TRAVIS_BRANCH
#git branch
#sudo git remote add origin https://${GH_TOKEN}@github.com/${TRAVIS_REPO_SLUG}.git
#git fetch --tags
msg="Tag $GIT_TAG Generated from TravisCI for build $TRAVIS_BUILD_NUMBER"
#if git tag $GIT_TAG -a -m "$msg" 2>/dev/null; then
sudo $TRAVIS_BUILD_DIR/travis-ci/modify-globalblacklist.sh
sudo chown travis:travis $TRAVIS_BUILD_DIR/globalblacklist.conf
git add $TRAVIS_BUILD_DIR/globalblacklist.conf
#git add .
#git add $TRAVIS_BUILD_DIR/build.txt
export GIT_TAG=V2.$YEAR-$MONTH.$TRAVIS_BUILD_NUMBER
#git tag detached-commit -f
git tag $GIT_TAG -a -m "Tag $GIT_TAG Generated from TravisCI for build $TRAVIS_BUILD_NUMBER"
#git commit -am "Update build version file $GIT_TAG with $TRAVIS_BUILD_NUMBER"
sudo git push origin master && git push origin master --tags
#git push https://${GH_TOKEN}@github.com/mitchellkrogza/Travis-CI-Nginx-for-Testing-Nginx-Configuration --all
ls -aR
#cat $TRAVIS_BUILD_DIR/globalblacklist.conf
#ls -la $TRAVIS_BUILD_DIR
#git branch -a
#echo $TRAVIS_BRANCH
#else echo Tag already exists!; fi

#YEAR=$(date +"%Y")
#MONTH=$(date +"%m")
#sudo git remote add origin https://${GH_TOKEN}@github.com/${TRAVIS_REPO_SLUG}.git
#sudo git config --global user.email "${GIT_EMAIL}"
#sudo git config --global user.name "${GIT_NAME}"
#sudo git config --global push.default simple
#export GIT_TAG=V2.$YEAR-$MONTH.$TRAVIS_BUILD_NUMBER
#export GIT_TAG=v1.0.$TRAVIS_BUILD_NUMBER
#git fetch --tags
#msg="Build $GIT_TAG"
#if git tag $GIT_TAG -a -m "$msg" 2>/dev/null; then
#sudo git tag $GIT_TAG -a -m "Build $GIT_TAG"
#sudo git push origin master && git push origin master --tags
#ls -aR
#else echo Tag already exists!; fi

#- git remote -v
#- git remote add origin https://${GH_TOKEN}@github.com/${TRAVIS_REPO_SLUG}.git
#- git config --global user.email "builds@travis-ci.com"
#- git config --global user.name "Travis CI"
#- git config --global user.email "${GIT_EMAIL}"
#- git config --global user.name "${GIT_NAME}"
#- git config --global push.default simple
#- export GIT_TAG=v1.0.$TRAVIS_BUILD_NUMBER
#- sudo $TRAVIS_BUILD_DIR/travis-ci/modify-globalblacklist.sh
#- cat $TRAVIS_BUILD_DIR/globalblacklist.conf
#- git commit -am "Travis Test Passed"
#- git commit -a
#- cd $TRAVIS_BUILD_DIR
#- git add $TRAVIS_BUILD_DIR/globalblacklist.conf
#- git commit -m "Build $TRAVIS_BUILD_NUMBER"
#- git commit -am "Build $TRAVIS_BUILD_NUMBER"
#- git tag $GIT_TAG -a -m "Tag Generated from TravisCI for build $TRAVIS_BUILD_NUMBER"
#- git push origin master && git push origin master --tags
#- git pull origin https://${GH_TOKEN}@github.com/mitchellkrogza/Travis-CI-Nginx-for-Testing-Nginx-Configuration
#- git push https://${GH_TOKEN}@github.com/mitchellkrogza/Travis-CI-Nginx-for-Testing-Nginx-Configuration --all
#- ls -aR
#!/bin/bash
# https://medium.com/bettercode/how-to-build-a-modern-ci-cd-pipeline-5faa01891a5b

docker login -u $DOCKER_USER -p $DOCKER_PASS
if [ "$TRAVIS_BRANCH" = "master" ]; then
    TAG="latest"
else
    TAG="$TRAVIS_BRANCH"
fi

# ,, is parameter substitution to make the variable lowercase
echo ${TRAVIS_REPO_SLUG,,}
echo ${TRAVIS_REPO_SLUG,,}:$TAG
docker build -f Dockerfile -t ${TRAVIS_REPO_SLUG,,}:$TAG .
docker push ${TRAVIS_REPO_SLUG,,}:$TAG
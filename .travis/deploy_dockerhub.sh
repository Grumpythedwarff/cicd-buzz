# https://medium.com/bettercode/how-to-build-a-modern-ci-cd-pipeline-5faa01891a5b
#!/bin/bash
docker login -u $DOCKER_USER -p $DOCKER_PASS
if [ "$TRAVIS_BRANCH" = "master" ]; then
    TAG="latest"
else
    TAG="$TRAVIS_BRANCH"
fi
echo "${BASH_VERSION}"
echo ${TRAVIS_REPO_SLUG}
echo ${TRAVIS_REPO_SLUG,,}
REPO_NAME=${TRAVIS_REPO_SLUG%/}
echo ${REPO_NAME}

docker build -f Dockerfile -t ${DOCKER_USER}/${REPO_NAME}:$TAG .
docker push ${DOCKER_USER}/${REPO_NAME}:$TAG
# https://medium.com/bettercode/how-to-build-a-modern-ci-cd-pipeline-5faa01891a5b
#!/bin/sh
docker login -u $DOCKER_USER -p $DOCKER_PASS
if [ "$TRAVIS_BRANCH" = "master" ]; then
    TAG="latest"
else
    TAG="$TRAVIS_BRANCH"
fi
REPO_NAME=${TRAVIS_REPO_SLUG%/}
echo ${REPO_NAME}
docker build -f Dockerfile -t ${DOCKER_USER}/${REPO_NAME}:$TAG .
docker push ${DOCKER_USER}/${REPO_NAME}:$TAG
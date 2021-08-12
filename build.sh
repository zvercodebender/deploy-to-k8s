#!/usr/bin/env bash

export CLI_VERSION="10.2.0"
TAG="$(git rev-parse --short HEAD)"
#export VERSION="3.1.1"
if [ -z "${TAG}" ]
then
  echo "VERSION not set"
  exit -1
fi
echo "Version = ${TAG}"
IMAGE="${REPO}:${TAG}"

echo "docker build -t ${IMAGE} -f Dockerfile ."
docker build -t ${IMAGE} -f Dockerfile .
docker login --username $DOCKER_USER --password $DOCKER_PASSWORD docker.io
echo "docker push ${IMAGE}"
docker push ${IMAGE}
sed -e "s?{{docker_repo}}?${REPO}?g;s?{{image_tag}}?${TAG}?g" kubernetes/deployment.yaml > kubernetes/hello-python.yaml

if [ -z "${GET_LOCAL}" ]
then
  xl apply --file dai-deploy/hello-python-deploy.yaml --values version=$TAG
else
  curl -LO https://dist.xebialabs.com/public/xl-cli/$CLI_VERSION/linux-amd64/xl
  chmod +x xl
  echo "xld url ${XLD_URL} xld user is ${XLD_USER}, xld password is ${XLD_PASSWD}"
  echo `env`
  ./xl apply --xl-deploy-url=$XLD_URL --xl-deploy-username=$XLD_USER --xl-deploy-password=$XLD_PASSWD --file dai-deploy/hello-python-deploy.yaml --values version=$TAG
  echo `./xl version`
  rm xl
fi
rm kubernetes/hello-python.yaml

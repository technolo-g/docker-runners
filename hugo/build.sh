#!/bin/bash -el

# If PUSH is set to true, push the image
push="$PUSH"

# Set our image name here for consistency
image="technolog/run-hugo"

docker build -t "$image" .
if [ "$push" == "true" ]; then
  docker push "$image"
fi

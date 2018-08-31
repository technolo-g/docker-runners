#!/bin/bash -el

# If PUSH is set to true, push the image
push="$PUSH"

# Set our image name here for consistency
image="technolog/run-yarn"

# Run the build, adding any passed in params like --no-cache
docker build "$@" -t "$image" $(dirname -- "$0")
if [ "$push" == "true" ]; then
  docker push "$image"
fi

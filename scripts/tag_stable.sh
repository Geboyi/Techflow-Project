#!/bin/bash
CURRENT_IMAGE=$(docker inspect --format='{{.Config.Image}}' techflow-container 2>/dev/null || echo "")

if [ -n "$CURRENT_IMAGE" ]; then
  docker tag $CURRENT_IMAGE ${DOCKERHUB_USERNAME}/techflow-app:previous_stable
  docker push ${DOCKERHUB_USERNAME}/techflow-app:previous_stable
  echo "Tagged current image as previous_stable"
fi
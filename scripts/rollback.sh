#!/bin/bash
docker stop techflow-container || true
docker rm techflow-container || true
docker pull ${DOCKERHUB_USERNAME}/techflow-app:previous_stable
docker run -d --name techflow-container -p 5000:5000 ${DOCKERHUB_USERNAME}/techflow-app:previous_stable

STATUS=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:5000/health)
if [ "$STATUS" == "200" ]; then
  echo "Rollback successful."
  exit 0
else
  echo "Rollback failed!"
  exit 1
fi
#!/bin/bash
URL="http://localhost:5000/health"
RETRIES=5
SLEEP=5

for i in $(seq 1 $RETRIES); do
  STATUS=$(curl -s -o /dev/null -w "%{http_code}" $URL)
  if [ "$STATUS" == "200" ]; then
    echo "Health check passed."
    exit 0
  fi
  echo "Health check failed, retrying ($i/$RETRIES)..."
  sleep $SLEEP
done

echo "Health check failed after $RETRIES attempts."
exit 1
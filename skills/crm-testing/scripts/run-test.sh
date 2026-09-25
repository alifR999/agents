#!/bin/bash

# run-test.sh <service> [output-file]
# Services: backend, subscriptions, product-catalogue

SERVICE=$1
OUTPUT_FILE=$2

BACKEND_DIR="/Users/alif/workspace/github.com/alifR999/crm-backend"

case $SERVICE in
  backend)
    DOCKER_SERVICE="api.crm.test"
    ;;
  subscriptions)
    DOCKER_SERVICE="subscription"
    ;;
  product-catalogue)
    DOCKER_SERVICE="product"
    ;;
  *)
    echo "Usage: $0 {backend|subscriptions|product-catalogue} [output-file]"
    exit 1
    ;;
esac

cd "$BACKEND_DIR" || { echo "Error: Could not enter directory $BACKEND_DIR"; exit 1; }

# Check if containers are running
if ! docker compose ps | grep -q "Up"; then
  echo "Error: No containers are running in $BACKEND_DIR"
  exit 1
fi

COMMAND="php artisan test"
if [ -n "$OUTPUT_FILE" ]; then
  docker compose exec -T "$DOCKER_SERVICE" $COMMAND > "$OUTPUT_FILE"
  echo "Tests completed. Output saved to $OUTPUT_FILE"
else
  docker compose exec -T "$DOCKER_SERVICE" $COMMAND
fi

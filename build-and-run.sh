#!/usr/bin/env bash

# Function to clean up the container on exit
cleanup() {
    echo "Stopping the container..."
    docker stop fac-container
}

# Ensure the cleanup function is called on script exit
trap cleanup EXIT

# Clear out log files
echo "Clearing log files..."
rm -rf "$(pwd)/logs/nginx/*"
rm -rf "$(pwd)/logs/gunicorn/*"

# Build the Docker image
echo "Building the Docker image..."
docker build -t fac .

# Run the Docker container in detached mode
echo "Running the Docker container in the background..."
docker run --rm --name fac-container -d -p 9999:9999 \
-v "$(pwd)/logs/nginx:/var/log/nginx" \
-v "$(pwd)/logs/gunicorn:/var/log/gunicorn" \
-v "$(pwd)/code:/app/code" \
--memory=100m fac

# Keep the script running and wait for ^C to stop the container
echo "Container is running. Press ^C to stop."
while true; do
    sleep 1
done

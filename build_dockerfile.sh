# Delete the Docker image
echo "Deleting Docker image..."
docker image rm -f coq_autograder

docker build -t coq_autograder .

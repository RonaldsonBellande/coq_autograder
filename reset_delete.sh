# Stop and remove the Docker container
echo "Stopping and removing Docker container..."
docker container stop "$(docker container ls -q --filter name=coq_autograder)"
docker container rm "$(docker container ls -aq --filter name=coq_autograder)"

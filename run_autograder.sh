#!/bin/bash

docker run -d --name my_coq_autograder coq_autograder

# Get the filename from the command line argument
filename="$1"

# Check if a filename is provided
if [ -z "$filename" ]; then
    echo "Error: Please provide the filename as an argument."
    exit 1
fi

# Check if the specified file exists
if [ -f "$filename" ]; then
    # Copy the file into the running Docker container
    docker cp "$filename" my_coq_autograder:/home/coq/autograder/application.v

    # Rename the file inside the Docker container
    docker exec my_coq_autograder mv "/home/coq/autograder/$filename" "/home/coq/autograder/application.v"
else
    echo "File not found: $filename"
fi

docker start my_coq_autograder && docker exec my_coq_autograder ./run_tests.sh

# Reset after everything
# ./reset_delete.sh

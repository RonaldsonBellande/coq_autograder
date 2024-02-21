# Use the official Coq Docker image as the base image
FROM coqorg/coq:latest

# Copy the Coq files and test scripts into the Docker container
COPY permission.sh /home/coq/autograder/
COPY test_example.v /home/coq/autograder/
COPY run_tests.sh /home/coq/autograder/

# Set the working directory
WORKDIR /home/coq/autograder

# Run the permission.sh script and remove it
RUN sudo bash /home/coq/autograder/permission.sh

# Specify the user to run the container
USER coq

# Run the tests when the container starts
CMD ["./run_tests.sh"]

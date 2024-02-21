#!/bin/bash

# Run permission again
sudo bash permission.sh

# Run Coq on the application.v file
coqc application.v > /dev/null 2>&1

# Check if compilation was successful
if [ $? -eq 0 ]; then
  echo "Compilation successful. Running tests..."

  # Run the Coq proof using coqtop and capture the output
  result=$(coqtop -batch -l application.v <<EOF
Check theorem.
EOF
)

  # Print the result for debugging
  echo "Result: $result"

  # Check if the output contains "theorem"
  if [[ $result == *"theorem"* ]]; then
    echo "Tests passed!"
    echo "Grade: 100%"
  else
    echo "Tests failed."
    echo "Grade: 0%"
  fi

else
  echo "Compilation failed. Exiting..."
fi

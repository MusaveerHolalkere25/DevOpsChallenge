## Write a script that takes a filename as an argument, checks if it exists, and prints the content of the file accordingly.


#!/bin/bash

# Check if a filename argument is provided
if [ $# -eq 0 ]; then
    echo "❌ Error: No filename provided."
    echo "Usage: ./check_file.sh <filename>"
    exit 1
fi

FILENAME="$1"

# Check if the file exists
if [ -f "$FILENAME" ]; then
    echo "✅ File '$FILENAME' found. Displaying content:"
    cat "$FILENAME"
else
    echo "❌ Error: File '$FILENAME' does not exist."
fi
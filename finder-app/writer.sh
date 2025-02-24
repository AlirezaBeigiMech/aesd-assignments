#!/bin/bash


# Check if both arguments are provided
if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Error: Both the file path and text string are required."
    exit 1
fi

# Get the full path to the file and the text string to write
writefile="$1"
writestr="$2"

# Create the directory path if it doesn't exist
dirpath=$(dirname "$writefile")
if [ ! -d "$dirpath" ]; then
    echo "Directory does not exist. Creating directory..."
    mkdir -p "$dirpath"
    if [ $? -ne 0 ]; then
        echo "Error: Failed to create directory $dirpath."
        exit 1
    fi
fi

# Write the string to the file, overwriting any existing file
echo "$writestr" > "$writefile"
if [ $? -ne 0 ]; then
    echo "Error: Failed to write to file $writefile."
    exit 1
fi

echo "File '$writefile' has been created/overwritten with the provided content."
exit 0
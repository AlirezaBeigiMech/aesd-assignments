#!/bin/bash

searchstr=$2  # Assign second argument to variable searchstr


dir=$1

if [ -d "$dir" ]; then
    echo "Directory '$dir' exists."
    file_count=$(ls -1 "$dir" | wc -l)
    
else
    echo "Directory '$dir' does not exist."
    exit 1
fi

if [ -n "$2" ]
then
    
    
    matching_lines=$(grep -r -c "$searchstr" "$dir" | awk -F: '{sum += $2} END {print sum}')
    
    echo "The number of files are $file_count and the number of matching lines are $matching_lines"
else
    echo "Variable does not exist."
    exit 1
fi
exit 0



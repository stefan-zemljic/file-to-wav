#!/bin/bash

# Directory for input
input_dir="input"

# Ensure there is an argument
if [ $# -eq 0 ]; then
    echo "No argument supplied"
    exit 1
fi
base_name=$input_dir/$1

# Ensure input directory exists
mkdir -p $input_dir

# Input file
suffix=1

# Find the highest suffix in use

## 1. Find all files with the same base name
files=$(find $input_dir -wholename "$base_name-*")

## 2. Extract the suffixes
suffixes=$(echo $files | sed -e "s|$base_name-||g")

## 3. Find the highest suffix
for suffix in $suffixes; do
    if [[ $suffix -gt $max_suffix ]]; then
        max_suffix=$suffix
    fi
done

## 4. Increment the suffix
suffix=$((max_suffix + 1))

input_file="$base_name-$suffix"

# Paste into a temporary file
tmp_file=tmp$(date +%s)
echo "" > $tmp_file
powershell.exe -command "Get-Clipboard -Format Text | Out-File -Encoding utf8 $tmp_file"

# Cat the first non-blank line of the temporary file but not more than 20 characters
echo "Start of pasted text:" $(
    sed -n '/./{p;q;}' $tmp_file | head -c 20
)

# Ask the user if they want to paste this file
read -p "Paste into $input_file? [y/n] " -n 1 -r

# Add a line break if the reply is not a line break
if [[ ! $REPLY =~ ^$ ]]; then
    echo
fi

# Check if the reply is yes
if [[ $REPLY =~ ^[Yy]$ ]]; then
    # Write current clipboard contents to input file
    cat $tmp_file >> $input_file

    # Print the name of the input file
    echo "Pasted into $input_file"
else
    # Print aborted
    echo "Aborted"
fi

# Remove temporary file
rm $tmp_file

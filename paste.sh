#!/bin/bash

# Ensure there is an argument
if [ $# -eq 0 ]; then
    echo "No argument supplied"
    exit 1
fi

# Input file
input_file=input/$1

# Ensure input directory exists
mkdir -p $input_dir

# Write current clipboard contents to input file
powershell.exe -command "Get-Clipboard -Format Text | Out-File $input_file"
#!/bin/bash

# Directory for input and output files
input_dir="input"
output_dir="output"

# Ensure output directory exists
mkdir -p $output_dir

# Loop over all files in the input directory
for input_file in $input_dir/*; do
    # Extract the base name of the file (without input directory)
    base_name=$(basename $input_file)

    # Check if corresponding output file does not exist
    if [ ! -f $output_dir/${base_name}_*.wav ]; then
        # Do not ask if -y was provided
        if [ "$1" != "-y" ]; then
            # Ask the user if they want to convert this file
            read -p "Convert $base_name? [y/n] " -n 1 -r
            echo
            if [[ ! $REPLY =~ ^[Yy]$ ]]; then
                continue
            fi
        fi

        # Run the command for this file
        cat $input_file | piper --model voices/en_US-amy-medium.onnx --output-raw --output_file $output_dir/${base_name}_$(date +%s).wav
    fi
done
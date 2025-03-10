#!/bin/bash

# Create 3 files with cur date/time + vendorids 1.0, 2.0, 4.0

# Input file (original dataset)
infile="$1"

# Three vendorid files
# Add them to gitignore automatically
file1="$(date "+%F-%T")-1.0.csv"
echo "Created $file1"
echo "$file1" >> ~/cs131/.gitignore

file2="$(date "+%F-%T")-2.0.csv"
echo "Created $file2"
echo "$file2" >> ~/cs131/.gitignore

file4="$(date "+%F-%T")-4.0.csv"
echo "Created $file4"
echo "$file4" >> ~/cs131/.gitignore

# Parse through each line of the input file
read -r header < $infile  # Read and discard the header
while IFS= read -r line; do
	if [[ $line =~ ^1\.0, ]]; then # Add lines that start with vendorid 1.0 to 1.0 file
		echo "$line" >> $file1
	elif [[ $line =~ ^2\.0, ]]; then # Add lines that start with vendorid 2.0 to 2.0 file
		echo "$line" >> $file2
	elif [[ $line =~ ^4\.0, ]]; then # Add lines that start with vendorid 4.0 to 4.0 file
		echo "$line" >> $file4
	fi
done < "$infile"

# Put word count and gitignore contents into ws4.txt
echo "$(wc $file1)" >> ~/cs131/ws4/ws4.txt
echo "$(wc $file2)" >> ~/cs131/ws4/ws4.txt
echo "$(wc $file4)" >> ~/cs131/ws4/ws4.txt
echo "$(cat ~/cs131/.gitignore)" >> ~/cs131/ws4/ws4.txt

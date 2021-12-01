#Student Name: Margret Beniameen
#Student ID: 10474901

#!/bin/bash

#if the text file rectangle.txt doesn't exist, print no file to process and exit  instead of getting an error message

if ! [ -f rectangle.txt ]; then
 echo "No file to process."
   exit 0

#if the rectangle_f txt file exists then delete it 

elif [ -f rectangle_f.txt ] ; then
    rm rectangle_f.txt 
fi

#sed 1d will delete the header line from the output file which is the first line of the file  
# s is a  Substitute command
#‘^’ is used to add the Word "Name:" to the start of all lines
#Because by default, sed will only change the first occurrence of the specified replacement string
#on each line it meets in the file, so the first comma it meets will be replaced by the word "Height:",
#then the second comma by the word "Width:", then the third comma by the word "Area:", and the last comma by the word "Colour:"
#Comma is replaced by the word Height and also space is added before the word using \t and space is left after it 
#Comma is replaced by the word Width and also space is added before the word and space is left after it 
#Comma is replaced by the word Area and also space is added before the word and space is left after it 
#Comma is replaced by the word Colour and also space is added before the word and space is left after it
#\t is used for TAB, -e is used to read multiple commands, \ at end of each command is used to run command across multiple lines
# /a/b/ the slash is used here as a delimiter in all lines
#Each command has given an open/close quotes 
#The information will be taken from file name rectangle.txt and The result after all the changes will be put in a new file called rectangle_f.txt  


sed -e '1d'\
    -e 's/^/Name: /'\
    -e 's/,/\tHeight: /' \
    -e 's/,/\t Width: /' \
    -e 's/,/\t Area: /'\
    -e 's/,/\t Colour: /' rectangle.txt > rectangle_f.txt  

exit 0
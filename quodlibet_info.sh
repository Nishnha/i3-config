#!/bin/bash
 
#-------------------------------------------------------------------------------
# Remember to set script to executable
#-------------------------------------------------------------------------------
 
FILE=~/.quodlibet/current             #The "current" file's location
if [ $1 -eq 1 ]                       #Branch to get the title or album.
    then
    txt=title                         #The line from "current" that I want
    truncnum=26                       #The number of characters before truncating
else                                  #I only needed to get 2, thus "else" works
    txt=album
    truncnum=32
fi
fullline=$( cat ${FILE} | grep $txt ) #Grab the line from $FILE
line=${fullline//$txt=/};             #Remove label from the line
if [ ${#line} -gt $truncnum ]         #Check if line is over cutoff point
    then
    trunc=$(echo ${line} | cut -c1-$truncnum) #Truncate the line
    origvar=${trunc}..                #Add a trailing ".."
else
    origvar=${line}                   #Untruncated line if not too long
fi
echo ${origvar};                      #Output the final product for conky

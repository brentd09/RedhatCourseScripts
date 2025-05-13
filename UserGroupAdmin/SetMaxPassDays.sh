#!/bin/bash

# Set up help 
if [[ $* =~ --help ]];then
  clear
  echo "Usage: $0 [<days>] "
  echo "Sets the maximum days for a users password"
  echo
  echo "With no days the default will be set to 50"
  echo "  --help         shows this content"
  echo 
  echo "Examples"
  echo "  $0 34"
  echo "  This will set the Maximum Password Time to be"
  echo "  34 days for selected users"
  echo 
  echo "Created by: Brent Denny"
  echo "Created on: 13-May-2025
  exit
fi

# Check to see if the first argument is a number using regex
if [[ $1 =~ [0-9]+ ]];then
  max_pass_age=$1
else
  max_pass_age=50
fi

# ASCII colors
# 30: Black, 31: Red, 32: Green, 33: Yellow, 34: Blue, 35: Magenta,
# 36: Cyan,  37: White, 0: Reset (back to default)
text_color=35

clear
echo "Changing the users MAX PASSWORD settings"
echo
# IFS sets the delimeter and the columns of data are read into the variables 
# ( _ is used to skip the field ) 
cat /etc/passwd | while IFS=: read -r username _ uid gid _ _ _; do
  if [[ $uid -gt 1000 ]];then
    echo -n "$username - should this user be modified? "
    # Because of the while read loop, we need to tell
    # this read command to get input from terminal (keyboard)
    read reponse < /dev/tty
    if [[ $reponse =~ ^[yY].* ]];then
      echo -e "\e[${text_color}mSetting $username max pass age to $max_pass_age\e[0m"
      # chage -M $max_pass_age $username
    fi
  fi
done

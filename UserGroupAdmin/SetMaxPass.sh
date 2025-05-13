#!/bin/bash

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

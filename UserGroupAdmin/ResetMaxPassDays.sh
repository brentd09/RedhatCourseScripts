#!/bin/bash

# Simple script to take all users that have a login shell od bash (except root)
# modify their max password age to the value of the variable MAXAGE below

MAXAGE=40

USERS=$(/etc/passwd | grep -i bash | grep -v root | cut -d: -f1)
for USER in USERS; do
  echo "Changing user ${USER}'s max password age to ${MAXAGE}"
  chage -M $MAXAGE $USER
done

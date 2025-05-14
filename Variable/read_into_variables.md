```bash
/bin/bash

IFS=":"

cat /etc/passwd | while read -r name pass uid gid userinfo homedir loginshell
```

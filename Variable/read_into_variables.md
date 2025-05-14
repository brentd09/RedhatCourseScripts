```bash
/bin/bash

IFS=":"

# All data is split into columns based on the IFS and placed in relevant variables based on position
cat /etc/passwd | while read -r name pass uid gid userinfo homedir loginshell; do
  echo $name $pass $uid $gid $userinfo $homedir $loginshell
done
```

<br>

```bash
/bin/bash

IFS=":"

# All remaining values are stored in the remaining variable
cat /etc/passwd | while read -r name pass uid gid remaining; do
  echo $name $pass $uid $gid $remaining
done
```

<br>

```bash
/bin/bash

IFS=":"

# _ means skip this field
cat /etc/passwd | while read -r name _ uid gid _; do
  echo $name $pass $uid $gid $remaining
done
```

# Parameter Expansion
## Bash provides powerful parameter expansion features for manipulating variables within functions. Some useful expansions include:
<br>

**${#var}:** Returns the length of the variable var.<br>
**${var:offset:length}:** Extracts a substring of var starting at offset with a maximum length.<br>
**${var/pattern/replacement}:** Replaces the first occurrence of pattern in var with replacement.<br>
**${var//pattern/replacement}:** Replaces all occurrences of pattern in var with replacement.<br>
**${var:-default}:** Returns var if it is set and not null; otherwise, it returns default.<br>
**${var:=default}:** If var is unset or null, it assigns default to var and returns default.<br>
**${var:?err_msg}:** If var is set and not null, returns its value; otherwise, prints err_msg and exits.<br>
**${var:+alt_val}:** If var is set and not null, returns alt_val; otherwise, returns null.<br>



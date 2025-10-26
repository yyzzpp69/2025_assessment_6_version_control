#!/bin/bash

# This script requires 'faker': python -m pip install faker

FULL_PATH_TO_SCRIPT="$(realpath "${BASH_SOURCE[-1]}")"
THIS_DIR=$(dirname ${FULL_PATH_TO_SCRIPT})
file="${THIS_DIR}/student_list.txt"


while IFS= read -r student_id; do
  faker paragraph -l en -r 10 | tr '[:upper:]' '[:lower:]' > "${student_id}.txt"
done < "$file"



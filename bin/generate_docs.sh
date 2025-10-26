#!/bin/bash

FULL_PATH_TO_SCRIPT="$(realpath "${BASH_SOURCE[-1]}")"
THIS_DIR=$(dirname ${FULL_PATH_TO_SCRIPT})
file="${THIS_DIR}/student_list.txt"


DOCS_DIR=${THIS_DIR}/../docs
mkdir -p ${DOCS_DIR}

while IFS= read -r student_id; do
  cp "${THIS_DIR}/changelog_template" "${DOCS_DIR}/${student_id}.txt"
done < "$file"



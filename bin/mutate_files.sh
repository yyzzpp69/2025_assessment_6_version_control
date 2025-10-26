#!/bin/bash

# Usage: mutate_files.sh BIOINFO* (make sure you don't include 'answers.txt')

set -e

FULL_PATH_TO_SCRIPT="$(realpath "${BASH_SOURCE[-1]}")"
BASE_DIR=$(dirname ${FULL_PATH_TO_SCRIPT})

ANSWERS_FILE=answers.txt
echo "filename,commit,message" > ${ANSWERS_FILE}

for filename in "$@"
do
    FAKE_REASON=$(faker bs)
    python3 ${BASE_DIR}/mutate.py ${filename}
    git add ${filename}
    git commit -m "${FAKE_REASON}"
    GIT_COMMIT=$(git rev-parse HEAD)
    echo "${filename},${GIT_COMMIT},${FAKE_REASON}" >> ${ANSWERS_FILE}
done

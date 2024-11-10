# compile_function.sh

set -e

#!/bin/bash

export SOURCE="/Users/anshrathod/desktop/ffmpeg_build_play/sw"
export COMPILED="/Users/anshrathod/desktop/ffmpeg_build_play/compile"

# compile_function.sh

#!/bin/bash

function download_tar() {
  local url=$1
  local name=$2
  local zipname=$3

  echo "♻️  Start compiling ${name}"

  rm -rf "${COMPILED}/${name}"

  # Download the file if it does not exist
  if [ ! -f "${COMPILED}/${zipname}" ]; then
    curl -L -o "${COMPILED}/${zipname}" "${url}"
  fi

  # Determine the correct tar flag based on the file extension
  local tar_flag
  if [[ ${zipname} == *.tar.gz ]]; then
    tar_flag="-xzvf"
  elif [[ ${zipname} == *.tar.bz2 ]]; then
    tar_flag="-xjvf"
  elif [[ ${zipname} == *.tar.xz ]]; then
    tar_flag="-xJvf"
  else
    echo "Unsupported file type: ${zipname}"
    return 1
  fi

  # Extract the tar file if the directory does not exist
  if [ ! -d "${COMPILED}/${name}" ]; then
    tar ${tar_flag} "${COMPILED}/${zipname}" -C "${COMPILED}"
  fi

  # Remove the downloaded archive file
  rm -rf "${COMPILED}/${zipname}"

  cd "${COMPILED}/${name}"
}

function download_git() {
  local url=$1
  local name=$2

  echo "♻️  Start compiling ${name}"

  # rm -rf "${COMPILED}/${name}"

  # Download the file if it does not exist
  if [ ! -d "${COMPILED}/${name}" ]; then
    git clone "${url}" "${COMPILED}/${name}"
  fi

  cd "${COMPILED}/${name}"
}
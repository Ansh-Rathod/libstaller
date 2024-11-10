# compile_function.sh

#!/bin/bash

export SOURCE="/Users/anshrathod/desktop/ffmpeg_build_play/sw"
export COMPILED="/Users/anshrathod/desktop/ffmpeg_build_play/compile"



function download_tar() {
  local url=$1
  local name=$2
  local zipname=$3

  echo "♻️  Start compiling ${name}"

  rm -rf "${COMPILED}/${name}"

  # Download the file if it does not exist
  if [ ! -f "${COMPILED}/${zipname}" ]; then
    curl -o "${COMPILED}/${zipname}" "${url}"
  fi

  # Extract the tar file if the directory does not exist
  if [ ! -d "${COMPILED}/${name}" ]; then
    tar -xjvf "${COMPILED}/${zipname}" -C "${COMPILED}"
  fi

  # Remove the downloaded archive file
  rm -rf "${COMPILED}/${zipname}"

  cd "${COMPILED}/${name}"
}
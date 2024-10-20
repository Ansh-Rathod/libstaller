
set -e

export SOURCE="Users/anshrathod/desktop/ffmpeg_build_play/sw"

export COMPILED="Users/anshrathod/desktop/ffmpeg_build_play/compile"

# Set paths
export PATH=${SOURCE}/bin:$PATH
export CC=clang && export PKG_CONFIG_PATH="${SOURCE}/lib/pkgconfig"



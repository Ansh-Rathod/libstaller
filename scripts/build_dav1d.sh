# export SOURCE="/Users/anshrathod/desktop/ffmpeg_build_play/sw"
# export COMPILED="/Users/anshrathod/desktop/ffmpeg_build_play/compile"

# echo '♻️  Start compiling dav1d'

# rm -rf ${COMPILED}/dav1d-1.5.0

# if [ ! -f ${COMPILED}/dav1d-1.5.0.tar.bz2 ]; then
#   curl -o ${COMPILED}/dav1d-1.5.0.tar.bz2 https://code.videolan.org/videolan/dav1d/-/archive/1.5.0/dav1d-1.5.0.tar.bz2
# fi

# # Extract the tar file into the target directory
# if [ ! -d ${COMPILED}/dav1d-1.5.0 ]; then
#   tar -xzvf ${COMPILED}/dav1d-1.5.0.tar.bz2 -C ${COMPILED}
# fi

# rm -rf ${COMPILED}/dav1d-1.5.0.tar.bz2

# cd ${COMPILED}/dav1d-1.5.0
export SOURCE="/Users/anshrathod/desktop/ffmpeg_build_play/sw"
export COMPILED="/Users/anshrathod/desktop/ffmpeg_build_play/compile"

echo '♻️  Start compiling aribb24'

rm -rf ${COMPILED}/aribb24-v1.0.4

if [ ! -f ${COMPILED}/aribb24-v1.0.4.tar.bz2 ]; then
  curl -o ${COMPILED}/aribb24-v1.0.4.tar.bz2 https://code.videolan.org/jeeb/aribb24/-/archive/v1.0.4/aribb24-v1.0.4.tar.bz2
fi


# Extract the tar file into the target directory
if [ ! -d ${COMPILED}/aribb24-v1.0.4 ]; then
  tar -xzvf ${COMPILED}/aribb24-v1.0.4.tar.bz2 -C ${COMPILED}
fi

rm -rf ${COMPILED}/aribb24-v1.0.4.tar.bz2

cd ${COMPILED}/aribb24-v1.0.4

./bootstrap
./configure --prefix=${SOURCE} --disable-shared --enable-static --disable-silent-rules

make -j ${CPU_NUM} && sudo make install


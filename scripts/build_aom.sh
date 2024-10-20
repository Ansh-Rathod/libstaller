export SOURCE="/Users/anshrathod/desktop/ffmpeg_build_play/sw"
export COMPILED="/Users/anshrathod/desktop/ffmpeg_build_play/compile"

echo '♻️  Start compiling AOM'


if [ ! -d ${COMPILED}/libaom ]; then
  git clone --depth=1 https://aomedia.googlesource.com/aom.git ${COMPILED}/libaom
fi

cd ${COMPILED}/libaom

mkdir -p build && cd build
cmake -DCMAKE_INSTALL_PREFIX=${SOURCE} -DBUILD_SHARED_LIBS=OFF -DENABLE_DOCS=OFF -DENABLE_EXAMPLES=OFF -DENABLE_TESTDATA=OFF -DENABLE_TESTS=OFF -DENABLE_TOOLS=OFF ..
make -j ${CPU_NUM} && sudo make install


sleep 1
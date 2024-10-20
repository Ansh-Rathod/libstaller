
export SOURCE="/Users/anshrathod/desktop/ffmpeg_build_play/sw"
export COMPILED="/Users/anshrathod/desktop/ffmpeg_build_play/compile"

url=https://github.com/freetype/freetype.git
name=freetype-2.13.3


echo '♻️  Start compiling ' + name

rm -rf ${COMPILED}/${name}


if [ ! -d ${COMPILED}/${name} ]; then
  git clone ${url} ${COMPILED}/${name}
fi

# rm -rf ${COMPILED}/${zipname}

cd ${COMPILED}/${name}

./autogen.sh

./configure --prefix=${SOURCE} --disable-shared --enable-static --enable-freetype-config --without-harfbuzz

make -j 10

sudo make install
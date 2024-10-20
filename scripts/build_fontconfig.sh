
export SOURCE="/Users/anshrathod/desktop/ffmpeg_build_play/sw"
export COMPILED="/Users/anshrathod/desktop/ffmpeg_build_play/compile"

url=https://www.freedesktop.org/software/fontconfig/release/fontconfig-2.15.0.tar.xz
name=fontconfig-2.15.0
zipname=fontconfig-2.15.0.tar.xz

echo '♻️  Start compiling ' + name

rm -rf ${COMPILED}/${name}

if [ ! -f ${COMPILED}/${zipname} ]; then
  curl -o ${COMPILED}/${zipname} ${url}
fi

# Extract the tar file into the target directory
if [ ! -d ${COMPILED}/${name} ]; then
  tar -xzvf ${COMPILED}/${zipname} -C ${COMPILED}
fi

rm -rf ${COMPILED}/${zipname}

cd ${COMPILED}/${name}

make clean

./configure --prefix=${SOURCE} --enable-iconv --disable-libxml2 --disable-dependency-tracking --disable-silent-rules --disable-shared --enable-static

make -j 10

sudo make install

sleep 1
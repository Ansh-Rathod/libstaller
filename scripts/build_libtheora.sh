source ./scripts/download_function.sh

url="https://downloads.xiph.org/releases/theora/libtheora-1.1.1.tar.bz2"
name="libtheora-1.1.1"
zipname="libtheora-1.1.1.tar.bz2"

download_tar "$url" "$name" "$zipname"

./configure --prefix=${SOURCE} --disable-asm --with-ogg-libraries=${SOURCE}/lib --with-ogg-includes=${SOURCE}/include/ --with-vorbis-libraries=${SOURCE}/lib --with-vorbis-includes=${SOURCE}/include/ --enable-static --disable-shared --disable-oggtest --disable-vorbistest --disable-examples

make -j 10

sudo make install

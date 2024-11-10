source ./scripts/download_function.sh

url="https://downloads.xiph.org/releases/vorbis/libvorbis-1.3.7.tar.xz"
name="libvorbis-1.3.7"
zipname="libvorbis-1.3.7.tar.xz"

download_tar "$url" "$name" "$zipname"

make clean

./configure --prefix=${SOURCE} --with-ogg-libraries=${SOURCE}/lib --with-ogg-includes=${SOURCE}/include/ --enable-static --disable-shared

make -j 10

sudo make install

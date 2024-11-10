source ./scripts/download_function.sh

url=https://www.freedesktop.org/software/fontconfig/release/fontconfig-2.15.0.tar.xz
name=fontconfig-2.15.0
zipname=fontconfig-2.15.0.tar.xz

download_tar "$url" "$name" "$zipname"

make clean

./configure --prefix=${SOURCE} --enable-iconv --disable-libxml2 --disable-dependency-tracking --disable-silent-rules --disable-shared --enable-static

make -j 10

sudo make install

sleep 1
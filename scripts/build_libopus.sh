source ./scripts/download_function.sh

url=https://ftp.osuosl.org/pub/xiph/releases/opus/opus-1.5.2.tar.gz
name=opus-1.5.2
zipname=opus-1.5.2.tar.gz

download_tar "$url" "$name" "$zipname"

./configure --prefix=${SOURCE} --disable-shared --enable-static

make -j 10

sudo make install

sleep 1
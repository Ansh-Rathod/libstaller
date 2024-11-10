source ./scripts/download_function.sh

url="https://github.com/sekrit-twc/zimg/archive/refs/tags/release-3.0.5.tar.gz"
name="zimg-release-3.0.5"
zipname="zimg-3.0.5.tar.gz"

download_tar "$url" "$name" "$zipname"


./autogen.sh

./Configure --prefix=${SOURCE} --disable-shared --enable-static

make -j 10

sudo make install
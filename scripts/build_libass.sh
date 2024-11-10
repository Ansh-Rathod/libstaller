source ./scripts/download_function.sh

url="https://github.com/libass/libass/releases/download/0.17.3/libass-0.17.3.tar.xz"
name="libass-0.17.3"
zipname="libass-0.17.3.tar.xz"

download_tar "$url" "$name" "$zipname"


./configure --prefix=${SOURCE} --disable-fontconfig --disable-shared --enable-static

make -j 10

sudo make install

sleep 1
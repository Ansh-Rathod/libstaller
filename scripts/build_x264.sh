source ./scripts/download_function.sh

url=https://code.videolan.org/videolan/x264.git
name=x264

download_git "$url" "$name"

./configure --prefix=${SOURCE} --disable-shared --enable-static --enable-pic

make -j 10

sudo make install

sudo make install-lib-static

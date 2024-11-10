source ./scripts/download_function.sh


url=https://gitlab.com/ClarkH/libmp3lame.git
name=lame-3.100

download_git "$url" "$name"

./configure --prefix=${SOURCE} --disable-shared --enable-static

make -j 10

sudo make install
source ./scripts/download_function.sh

url="https://github.com/harfbuzz/harfbuzz/archive/refs/tags/6.0.0.tar.gz"
name="harfbuzz-6.0.0"
zipname="harfbuzz-6.0.0.tar.gz"

download_tar "$url" "$name" "$zipname"

./autogen.sh

./configure --prefix=${SOURCE} --disable-shared --enable-static

make -j 10

make install

source ./scripts/download_function.sh


url="https://storage.googleapis.com/downloads.webmproject.org/releases/webp/libwebp-1.4.0.tar.gz"
name="libwebp-1.4.0"
zipname="libwebp-1.4.0.tar.gz"

download_tar "$url" "$name" "$zipname"

cmake -DCMAKE_INSTALL_PREFIX:PATH=${SOURCE} -DENABLE_C_DEPS=ON -DLIBTYPE=STATIC -DENABLE_SHARED=OFF -DENABLE_STATIC=ON .

make -j 10

sudo make install

sleep 1
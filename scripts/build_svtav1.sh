source ./scripts/download_function.sh

url="https://gitlab.com/AOMediaCodec/SVT-AV1/-/archive/v2.2.1/SVT-AV1-v2.2.1.tar.bz2"
name="SVT-AV1-v2.2.1"
zipname="SVT-AV1-v2.2.1.tar.bz2"

download_tar "$url" "$name" "$zipname"

cmake -DCMAKE_INSTALL_PREFIX:PATH=${SOURCE} -DCMAKE_BUILD_TYPE=Release -DBUILD_DEC=OFF -DBUILD_SHARED_LIBS=OFF -DLIBTYPE=STATIC -DENABLE_SHARED=OFF -DENABLE_STATIC=ON .

make -j 10

make install

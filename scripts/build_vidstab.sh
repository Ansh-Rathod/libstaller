source ./scripts/download_function.sh

url="https://github.com/georgmartius/vid.stab/archive/refs/tags/v1.1.1.tar.gz"
name="vid.stab-1.1.1"
zipname="vidstab-1.1.1.tar.gz"

download_tar "$url" "$name" "$zipname"

cmake -DCMAKE_INSTALL_PREFIX:PATH=${SOURCE} -DLIBTYPE=STATIC -DBUILD_SHARED_LIBS=OFF -DUSE_OMP=OFF -DENABLE_SHARED=off .

make -j 10

sudo make install

source ./scripts/download_function.sh

url=https://github.com/uclouvain/openjpeg.git
name=openjpeg

download_git "$url" "$name" 

cmake -DCMAKE_INSTALL_PREFIX:PATH=${SOURCE} -DENABLE_C_DEPS=ON -DLIBTYPE=STATIC -DENABLE_SHARED=OFF -DENABLE_STATIC=ON .

make -j 10

sudo make install

rm ${SOURCE}/lib/libopenjp2.2.5.0.dy*
rm ${SOURCE}/lib/libopenjp2.dy*
rm ${SOURCE}/lib/libopenjp2.7.dy*


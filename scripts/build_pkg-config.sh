#!/usr/bin/env zsh
echo '♻️  Start compiling PKG'


export SOURCE="/Users/anshrathod/desktop/ffmpeg_build_play/sw"


# Set paths
export PATH=${SOURCE}/bin:$PATH
export CC=clang && export PKG_CONFIG_PATH="${SOURCE}/lib/pkgconfig"

export COMPILED="/Users/anshrathod/desktop/ffmpeg_build_play/compile"

rm -rf ${COMPILED}/pkg-config-0.29.2

# Download pkg-config if not already present in the ${COMPILED} folder
if [ ! -f ${COMPILED}/pkg-config-0.29.2.tar.gz ]; then
  curl -o ${COMPILED}/pkg-config-0.29.2.tar.gz https://pkgconfig.freedesktop.org/releases/pkg-config-0.29.2.tar.gz
fi


# Extract the tar file into the target directory
if [ ! -d ${COMPILED}/pkg-config-0.29.2 ]; then
  tar -xzvf ${COMPILED}/pkg-config-0.29.2.tar.gz -C ${COMPILED}
fi

rm ${COMPILED}/pkg-config-0.29.2.tar.gz

sleep 1

# Navigate into the extracted directory
cd ${COMPILED}/pkg-config-0.29.2

make clean

export LDFLAGS="-framework Foundation -framework Cocoa"
CFLAGS="-Wno-int-conversion" CXXFLAGS="-Wno-int-conversion" ./configure --disable-debug --prefix=${SOURCE} --with-pc-path=${SOURCE}/lib/pkgconfig --with-internal-glib --disable-shared --enable-static

make -j 10
sudo make install

unset LDFLAGS
sleep 1
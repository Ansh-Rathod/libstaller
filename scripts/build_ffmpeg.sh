source ./scripts/download_function.sh

url="https://github.com/FFmpeg/FFmpeg/archive/refs/tags/n7.0.tar.gz"
name="ffmpeg-n7.0"
zipname="ffmpeg-n7.0.tar.gz"

# download_tar "$url" "$name" "$zipname"

cd "${COMPILED}/${name}"


export LDFLAGS="-L${SOURCE}/lib"

export CFLAGS="-I${SOURCE}/include"

export LDFLAGS="$LDFLAGS -framework VideoToolbox"

./configure --prefix=${SOURCE} --extra-cflags="-fno-stack-check" --arch=arm64 --cc=/usr/bin/clang --enable-gpl --enable-libbluray --enable-libopenjpeg --enable-libopus --enable-libmp3lame --enable-libx264 --enable-libx265 --enable-libvpx --enable-libwebp --enable-libass   --enable-libvorbis --enable-libsnappy --enable-libaom --enable-libvidstab --enable-libzimg --enable-libsvtav1 --enable-libkvazaar --enable-libharfbuzz --pkg-config-flags=--static --enable-ffplay --enable-postproc --enable-neon --enable-runtime-cpudetect --extra-libs="-lbrotlidec -lbrotlienc -lbrotlicommon" --disable-indev=qtkit --disable-indev=x11grab_xcb --host-ldflags='-Wl,-ld_classic'

make -j 10

sudo make install

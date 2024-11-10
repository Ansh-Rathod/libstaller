source ./scripts/download_function.sh

name=libvpx-1.13.1

# zipname=x265_3.6.tar.gz

# download_tar "$url" "$name" "$zipname"

rm -rf "${COMPILED}/${name}"

  # Download the file if it does not exist
if [ ! -d "${COMPILED}/${name}" ]; then
    git clone https://github.com/webmproject/libvpx.git -b v1.13.1 "${COMPILED}/${name}"
fi

cd "${COMPILED}/${name}"



./configure --prefix=${SOURCE} --enable-vp8 --enable-postproc --enable-vp9-postproc --enable-vp9-highbitdepth --disable-examples --disable-docs --enable-multi-res-encoding --disable-unit-tests --enable-pic --disable-shared

make -j 10

sudo make install
source ./scripts/download_function.sh

url=https://github.com/ultravideo/kvazaar.git
name=kvazaar

rm -rf "${COMPILED}/${name}"

# Download the file if it does not exist
if [ ! -d "${COMPILED}/${name}" ]; then
  git clone --recurse-submodules "${url}" -b "v2.2.0" "${COMPILED}/${name}" 
fi

cd "${COMPILED}/${name}"
./autogen.sh
./configure --prefix=${SOURCE} --disable-shared --enable-static

make -j 10

sudo make install

sleep 1
source ./scripts/download_function.sh

url=https://github.com/google/snappy.git
name="snappy-1.2.1"


echo "♻️  Start compiling ${name}"

rm -rf "${COMPILED}/${name}"

# Download the file if it does not exist
if [ ! -d "${COMPILED}/${name}" ]; then
  git clone --recurse-submodules "${url}" -b "1.2.1" "${COMPILED}/${name}"
fi

cd "${COMPILED}/${name}"

cmake -DCMAKE_INSTALL_PREFIX:PATH=${SOURCE} -DENABLE_SHARED=OFF -DENABLE_CLI=OFF

make -j 10

sudo make install

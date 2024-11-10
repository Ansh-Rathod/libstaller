source ./scripts/download_function.sh

# url=https://bitbucket.org/multicoreware/x265_git/downloads/x265_3.6.tar.gz
name=x265-3.6
# zipname=x265_3.6.tar.gz

# download_tar "$url" "$name" "$zipname"

rm -rf "${COMPILED}/${name}"

  # Download the file if it does not exist
if [ ! -d "${COMPILED}/${name}" ]; then
    git clone https://rathodappiii89@bitbucket.org/multicoreware/x265_git.git -b Release_3.6 "${COMPILED}/${name}"
fi

cd "${COMPILED}/${name}"

#!/bin/bash



X265_SOURCE="${COMPILED}/${name}/source"

# Cleanup function
cleanup_build() {
    make clean-generated 2>/dev/null || true
    rm -f CMakeCache.txt
}

# Common cmake options
CMAKE_COMMON_OPTIONS="-DCMAKE_INSTALL_PREFIX:PATH=${SOURCE} -DENABLE_SHARED=NO -DENABLE_CLI=OFF"

# Initial cleanup
echo "🧹 Cleaning up previous builds..."
rm -f "${SOURCE}/include/x265"*.h 2>/dev/null
rm -f "${SOURCE}/lib/libx265.a" 2>/dev/null

# Build 12-bit
echo "♻️ Building X265 12-bit..."
cd "${X265_SOURCE}"
cmake ${CMAKE_COMMON_OPTIONS} \
    -DHIGH_BIT_DEPTH=ON \
    -DMAIN12=ON \
    -DEXPORT_C_API=NO .
make
mv libx265.a libx265_main12.a
cleanup_build

# Build 10-bit
echo "♻️ Building X265 10-bit..."
cd "${X265_SOURCE}"
cmake ${CMAKE_COMMON_OPTIONS} \
    -DHIGH_BIT_DEPTH=ON \
    -DMAIN10=ON \
    -DENABLE_HDR10_PLUS=ON \
    -DEXPORT_C_API=NO .
make clean
make
mv libx265.a libx265_main10.a
cleanup_build

# Build 8-bit with 10/12-bit linking
echo "♻️ Building X265 main..."
cd "${X265_SOURCE}"
cmake ${CMAKE_COMMON_OPTIONS} \
    -DEXTRA_LIB="x265_main10.a;x265_main12.a" \
    -DEXTRA_LINK_FLAGS=-L. \
    -DLINKED_10BIT=ON \
    -DLINKED_12BIT=ON .
make clean
make
mv libx265.a libx265_main.a

# Combine all libraries
echo "🔨 Creating final static library..."
libtool -static -o libx265.a libx265_main.a libx265_main10.a libx265_main12.a 2>/dev/null

# Install
echo "📦 Installing..."
make install

echo "✅ Build completed successfully!"
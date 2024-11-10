

# Source the compile function
source ./scripts/download_function.sh

# Example usage
url="https://download.videolan.org/videolan/libbluray/1.3.4/libbluray-1.3.4.tar.bz2"
name="libbluray-1.3.4"
zipname="libbluray-1.3.4.tar.bz2"

# Call the compile function
download_tar "$url" "$name" "$zipname"

./bootstrap

./configure --prefix=${SOURCE} --disable-shared --enable-static --disable-dependency-tracking --disable-silent-rules --without-libxml2 --without-freetype --disable-doxygen-doc --disable-bdjava-jar

make -j 14

make install
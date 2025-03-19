mkdir -p node-gyp/18.19.0
tar -xf node-v18.19.0-headers.tar.gz --directory node-gyp/18.19.0/ --strip-components 1
echo 18 > node-gyp/18.19.0/installVersion
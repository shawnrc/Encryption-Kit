#!/bin/bash

cd "${LIBRARY_WORKING_DIRECTORY_LOCATION}"

curl -O "http://www.openssl.org/source/openssl-${LIBRARY_OPENSSL_VERSION}.tar.gz"

tar -xvzf "./openssl-${LIBRARY_OPENSSL_VERSION}.tar.gz"

mv "./openssl-${LIBRARY_OPENSSL_VERSION}" "./openssl-source"

cd "./openssl-source"
./Configure darwin64-${LIBRARY_ARCHITECTURE_TO_BUILD}-cc no-ssl2 no-ssl3
make

if [ ! -d "${LIBRARY_BUILD_RESULT_INCLUDE_LOCAITON}" ]; then
	BUILT_PRODUCT_INCLUDE_LOCATION="${LIBRARY_WORKING_DIRECTORY_LOCATION}openssl-source/include/openssl"

	cp -RL "${BUILT_PRODUCT_INCLUDE_LOCATION}" "${LIBRARY_BUILD_RESULT_INCLUDE_LOCAITON}"
fi

BUILT_PRODUCT_LIBRARY_ORIGINAL_LOCATION="${LIBRARY_WORKING_DIRECTORY_LOCATION}openssl-source/libcrypto.a"

cp "${BUILT_PRODUCT_LIBRARY_ORIGINAL_LOCATION}" "${LIBRARY_BUILD_RESULT_LIBRARY_LOCATION}"
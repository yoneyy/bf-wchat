cmd_Release/obj.target/bf-wchat/wework_chat.o := g++ -o Release/obj.target/bf-wchat/wework_chat.o ../wework_chat.cpp '-DNODE_GYP_MODULE_NAME=bf-wchat' '-DUSING_UV_SHARED=1' '-DUSING_V8_SHARED=1' '-DV8_DEPRECATION_WARNINGS=1' '-DV8_DEPRECATION_WARNINGS' '-DV8_IMMINENT_DEPRECATION_WARNINGS' '-D_LARGEFILE_SOURCE' '-D_FILE_OFFSET_BITS=64' '-D__STDC_FORMAT_MACROS' '-DOPENSSL_NO_PINSHARED' '-DOPENSSL_THREADS' '-DNAPI_DISABLE_CPP_EXCEPTIONS' '-DBUILDING_NODE_EXTENSION' -I/root/.cache/node-gyp/14.18.1/include/node -I/root/.cache/node-gyp/14.18.1/src -I/root/.cache/node-gyp/14.18.1/deps/openssl/config -I/root/.cache/node-gyp/14.18.1/deps/openssl/openssl/include -I/root/.cache/node-gyp/14.18.1/deps/uv/include -I/root/.cache/node-gyp/14.18.1/deps/zlib -I/root/.cache/node-gyp/14.18.1/deps/v8/include -I../include/**/* -I/www/test/wework-chat-cpp/node_modules/node-addon-api  -fPIC -pthread -Wall -Wextra -Wno-unused-parameter -m64 -O3 -fno-omit-frame-pointer -fno-rtti -std=gnu++1y -MMD -MF ./Release/.deps/Release/obj.target/bf-wchat/wework_chat.o.d.raw   -c
Release/obj.target/bf-wchat/wework_chat.o: ../wework_chat.cpp \
 /www/test/wework-chat-cpp/node_modules/node-addon-api/napi.h \
 /root/.cache/node-gyp/14.18.1/include/node/node_api.h \
 /root/.cache/node-gyp/14.18.1/include/node/js_native_api.h \
 /root/.cache/node-gyp/14.18.1/include/node/js_native_api_types.h \
 /root/.cache/node-gyp/14.18.1/include/node/node_api_types.h \
 /www/test/wework-chat-cpp/node_modules/node-addon-api/napi-inl.h \
 /www/test/wework-chat-cpp/node_modules/node-addon-api/napi-inl.deprecated.h \
 /root/.cache/node-gyp/14.18.1/include/node/openssl/rsa.h \
 /root/.cache/node-gyp/14.18.1/include/node/openssl/opensslconf.h \
 /root/.cache/node-gyp/14.18.1/include/node/openssl/./opensslconf_asm.h \
 /root/.cache/node-gyp/14.18.1/include/node/openssl/././archs/linux-x86_64/asm/include/openssl/opensslconf.h \
 /root/.cache/node-gyp/14.18.1/include/node/openssl/opensslv.h \
 /root/.cache/node-gyp/14.18.1/include/node/openssl/asn1.h \
 /root/.cache/node-gyp/14.18.1/include/node/openssl/e_os2.h \
 /root/.cache/node-gyp/14.18.1/include/node/openssl/bio.h \
 /root/.cache/node-gyp/14.18.1/include/node/openssl/crypto.h \
 /root/.cache/node-gyp/14.18.1/include/node/openssl/safestack.h \
 /root/.cache/node-gyp/14.18.1/include/node/openssl/stack.h \
 /root/.cache/node-gyp/14.18.1/include/node/openssl/ossl_typ.h \
 /root/.cache/node-gyp/14.18.1/include/node/openssl/cryptoerr.h \
 /root/.cache/node-gyp/14.18.1/include/node/openssl/symhacks.h \
 /root/.cache/node-gyp/14.18.1/include/node/openssl/bioerr.h \
 /root/.cache/node-gyp/14.18.1/include/node/openssl/asn1err.h \
 /root/.cache/node-gyp/14.18.1/include/node/openssl/bn.h \
 /root/.cache/node-gyp/14.18.1/include/node/openssl/bnerr.h \
 /root/.cache/node-gyp/14.18.1/include/node/openssl/rsaerr.h \
 /root/.cache/node-gyp/14.18.1/include/node/openssl/pem.h \
 /root/.cache/node-gyp/14.18.1/include/node/openssl/evp.h \
 /root/.cache/node-gyp/14.18.1/include/node/openssl/evperr.h \
 /root/.cache/node-gyp/14.18.1/include/node/openssl/objects.h \
 /root/.cache/node-gyp/14.18.1/include/node/openssl/obj_mac.h \
 /root/.cache/node-gyp/14.18.1/include/node/openssl/objectserr.h \
 /root/.cache/node-gyp/14.18.1/include/node/openssl/x509.h \
 /root/.cache/node-gyp/14.18.1/include/node/openssl/buffer.h \
 /root/.cache/node-gyp/14.18.1/include/node/openssl/buffererr.h \
 /root/.cache/node-gyp/14.18.1/include/node/openssl/ec.h \
 /root/.cache/node-gyp/14.18.1/include/node/openssl/ecerr.h \
 /root/.cache/node-gyp/14.18.1/include/node/openssl/dsa.h \
 /root/.cache/node-gyp/14.18.1/include/node/openssl/dh.h \
 /root/.cache/node-gyp/14.18.1/include/node/openssl/dherr.h \
 /root/.cache/node-gyp/14.18.1/include/node/openssl/dsaerr.h \
 /root/.cache/node-gyp/14.18.1/include/node/openssl/sha.h \
 /root/.cache/node-gyp/14.18.1/include/node/openssl/x509err.h \
 /root/.cache/node-gyp/14.18.1/include/node/openssl/x509_vfy.h \
 /root/.cache/node-gyp/14.18.1/include/node/openssl/lhash.h \
 /root/.cache/node-gyp/14.18.1/include/node/openssl/pkcs7.h \
 /root/.cache/node-gyp/14.18.1/include/node/openssl/pkcs7err.h \
 /root/.cache/node-gyp/14.18.1/include/node/openssl/pemerr.h \
 ../include/WeWorkFinanceSdk_C.h ../include/rapidjson/writer.h \
 ../include/rapidjson/stream.h ../include/rapidjson/rapidjson.h \
 ../include/rapidjson/encodings.h ../include/rapidjson/internal/clzll.h \
 ../include/rapidjson/internal/../rapidjson.h \
 ../include/rapidjson/internal/meta.h \
 ../include/rapidjson/internal/stack.h \
 ../include/rapidjson/internal/../allocators.h \
 ../include/rapidjson/internal/../rapidjson.h \
 ../include/rapidjson/internal/swap.h \
 ../include/rapidjson/internal/strfunc.h \
 ../include/rapidjson/internal/../stream.h \
 ../include/rapidjson/internal/dtoa.h \
 ../include/rapidjson/internal/itoa.h \
 ../include/rapidjson/internal/diyfp.h \
 ../include/rapidjson/internal/clzll.h \
 ../include/rapidjson/internal/ieee754.h \
 ../include/rapidjson/internal/itoa.h ../include/rapidjson/stringbuffer.h \
 ../include/rapidjson/document.h ../include/rapidjson/reader.h \
 ../include/rapidjson/allocators.h ../include/rapidjson/encodedstream.h \
 ../include/rapidjson/memorystream.h \
 ../include/rapidjson/internal/strtod.h \
 ../include/rapidjson/internal/biginteger.h \
 ../include/rapidjson/internal/pow10.h ../include/rapidjson/error/error.h \
 ../include/rapidjson/error/../rapidjson.h \
 ../include/rapidjson/stringbuffer.h
../wework_chat.cpp:
/www/test/wework-chat-cpp/node_modules/node-addon-api/napi.h:
/root/.cache/node-gyp/14.18.1/include/node/node_api.h:
/root/.cache/node-gyp/14.18.1/include/node/js_native_api.h:
/root/.cache/node-gyp/14.18.1/include/node/js_native_api_types.h:
/root/.cache/node-gyp/14.18.1/include/node/node_api_types.h:
/www/test/wework-chat-cpp/node_modules/node-addon-api/napi-inl.h:
/www/test/wework-chat-cpp/node_modules/node-addon-api/napi-inl.deprecated.h:
/root/.cache/node-gyp/14.18.1/include/node/openssl/rsa.h:
/root/.cache/node-gyp/14.18.1/include/node/openssl/opensslconf.h:
/root/.cache/node-gyp/14.18.1/include/node/openssl/./opensslconf_asm.h:
/root/.cache/node-gyp/14.18.1/include/node/openssl/././archs/linux-x86_64/asm/include/openssl/opensslconf.h:
/root/.cache/node-gyp/14.18.1/include/node/openssl/opensslv.h:
/root/.cache/node-gyp/14.18.1/include/node/openssl/asn1.h:
/root/.cache/node-gyp/14.18.1/include/node/openssl/e_os2.h:
/root/.cache/node-gyp/14.18.1/include/node/openssl/bio.h:
/root/.cache/node-gyp/14.18.1/include/node/openssl/crypto.h:
/root/.cache/node-gyp/14.18.1/include/node/openssl/safestack.h:
/root/.cache/node-gyp/14.18.1/include/node/openssl/stack.h:
/root/.cache/node-gyp/14.18.1/include/node/openssl/ossl_typ.h:
/root/.cache/node-gyp/14.18.1/include/node/openssl/cryptoerr.h:
/root/.cache/node-gyp/14.18.1/include/node/openssl/symhacks.h:
/root/.cache/node-gyp/14.18.1/include/node/openssl/bioerr.h:
/root/.cache/node-gyp/14.18.1/include/node/openssl/asn1err.h:
/root/.cache/node-gyp/14.18.1/include/node/openssl/bn.h:
/root/.cache/node-gyp/14.18.1/include/node/openssl/bnerr.h:
/root/.cache/node-gyp/14.18.1/include/node/openssl/rsaerr.h:
/root/.cache/node-gyp/14.18.1/include/node/openssl/pem.h:
/root/.cache/node-gyp/14.18.1/include/node/openssl/evp.h:
/root/.cache/node-gyp/14.18.1/include/node/openssl/evperr.h:
/root/.cache/node-gyp/14.18.1/include/node/openssl/objects.h:
/root/.cache/node-gyp/14.18.1/include/node/openssl/obj_mac.h:
/root/.cache/node-gyp/14.18.1/include/node/openssl/objectserr.h:
/root/.cache/node-gyp/14.18.1/include/node/openssl/x509.h:
/root/.cache/node-gyp/14.18.1/include/node/openssl/buffer.h:
/root/.cache/node-gyp/14.18.1/include/node/openssl/buffererr.h:
/root/.cache/node-gyp/14.18.1/include/node/openssl/ec.h:
/root/.cache/node-gyp/14.18.1/include/node/openssl/ecerr.h:
/root/.cache/node-gyp/14.18.1/include/node/openssl/dsa.h:
/root/.cache/node-gyp/14.18.1/include/node/openssl/dh.h:
/root/.cache/node-gyp/14.18.1/include/node/openssl/dherr.h:
/root/.cache/node-gyp/14.18.1/include/node/openssl/dsaerr.h:
/root/.cache/node-gyp/14.18.1/include/node/openssl/sha.h:
/root/.cache/node-gyp/14.18.1/include/node/openssl/x509err.h:
/root/.cache/node-gyp/14.18.1/include/node/openssl/x509_vfy.h:
/root/.cache/node-gyp/14.18.1/include/node/openssl/lhash.h:
/root/.cache/node-gyp/14.18.1/include/node/openssl/pkcs7.h:
/root/.cache/node-gyp/14.18.1/include/node/openssl/pkcs7err.h:
/root/.cache/node-gyp/14.18.1/include/node/openssl/pemerr.h:
../include/WeWorkFinanceSdk_C.h:
../include/rapidjson/writer.h:
../include/rapidjson/stream.h:
../include/rapidjson/rapidjson.h:
../include/rapidjson/encodings.h:
../include/rapidjson/internal/clzll.h:
../include/rapidjson/internal/../rapidjson.h:
../include/rapidjson/internal/meta.h:
../include/rapidjson/internal/stack.h:
../include/rapidjson/internal/../allocators.h:
../include/rapidjson/internal/../rapidjson.h:
../include/rapidjson/internal/swap.h:
../include/rapidjson/internal/strfunc.h:
../include/rapidjson/internal/../stream.h:
../include/rapidjson/internal/dtoa.h:
../include/rapidjson/internal/itoa.h:
../include/rapidjson/internal/diyfp.h:
../include/rapidjson/internal/clzll.h:
../include/rapidjson/internal/ieee754.h:
../include/rapidjson/internal/itoa.h:
../include/rapidjson/stringbuffer.h:
../include/rapidjson/document.h:
../include/rapidjson/reader.h:
../include/rapidjson/allocators.h:
../include/rapidjson/encodedstream.h:
../include/rapidjson/memorystream.h:
../include/rapidjson/internal/strtod.h:
../include/rapidjson/internal/biginteger.h:
../include/rapidjson/internal/pow10.h:
../include/rapidjson/error/error.h:
../include/rapidjson/error/../rapidjson.h:
../include/rapidjson/stringbuffer.h:

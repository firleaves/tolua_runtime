#!/bin/bash
# 32 Bit Version
mkdir -p window/x86

cd luajit-2.1
mingw32-make clean

mingw32-make BUILDMODE=static CC="gcc -m32 -O2"
cp src/libluajit.a ../window/x86/libluajit.a
mingw32-make clean

cd ..

gcc -m32 -O2 -std=gnu99 -shared \
	int64.c \
	uint64.c \
	tolua.c \
	lpeg.c \
	struct.c \
	cjson/strbuf.c \
	cjson/lua_cjson.c \
	cjson/fpconv.c \
	luasocket/auxiliar.c \
	luasocket/buffer.c \
	luasocket/except.c \
	luasocket/inet.c \
	luasocket/io.c \
	luasocket/luasocket.c \
	luasocket/mime.c \
	luasocket/options.c \
	luasocket/select.c \
	luasocket/tcp.c \
	luasocket/timeout.c \
	luasocket/udp.c \
	luasocket/wsocket.c \
	lua-protobuf/pb.c \
	-o Plugins/x86/tolua.dll \
	-I./ \
	-Iluajit-2.1/src \
	-Icjson \
	-Iluasocket \
	-Ilua-protobuf \
	-lws2_32 \
	-Wl,--whole-archive window/x86/libluajit.a -Wl,--no-whole-archive -static-libgcc -static-libstdc++

	# pb.c \
	# pbc/alloc.c \
	# pbc/array.c \
	# pbc/bootstrap.c \
	# pbc/context.c \
	# pbc/decode.c \
	# pbc/map.c \
	# pbc/pattern.c \
	# pbc/proto.c \
	# pbc/register.c \
	# pbc/rmessage.c \
	# pbc/stringpool.c \
	# pbc/varint.c \
	# pbc/wmessage.c \
	# pbc-lua.c \
		# -Ipbc \
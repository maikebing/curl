#!/bin/sh

./reconf
if [ -f "Makefile" ]; then
	make distclean
fi



rm config.cache config.status -f
if [ $1 = "x86" ]
  then   
  echo "Build X86"
      ./configure   --target=i686-pc-linux-gnu \
        --host=i686-pc-linux-gnu \
        --build=i686-pc-linux-gnu \
	-disable-shared --enable-static \
	--without-ssl  --without-librtmp   \
	--disable-ldap  --disable-rtsp  --disable-dict --disable-smtp --disable-gopher --disable-manual \
	--disable-ipv6 --disable-openssl-auto-load-config --disable-sspi  --disable-crypto-auth  --without-zlib 
  elif [ $1 = "arm" ]
  then
  echo "build arm"
AR="/opt/fullhan/toolchain/arm-fullhanv3-linux-uclibcgnueabi-b6/bin/arm-fullhanv3-linux-uclibcgnueabi-ar" \
AS="/opt/fullhan/toolchain/arm-fullhanv3-linux-uclibcgnueabi-b6/bin/arm-fullhanv3-linux-uclibcgnueabi-as" \
LD="/opt/fullhan/toolchain/arm-fullhanv3-linux-uclibcgnueabi-b6/bin/arm-fullhanv3-linux-uclibcgnueabi-ld" \
NM="/opt/fullhan/toolchain/arm-fullhanv3-linux-uclibcgnueabi-b6/bin/arm-fullhanv3-linux-uclibcgnueabi-nm" \
CC="/opt/fullhan/toolchain/arm-fullhanv3-linux-uclibcgnueabi-b6/bin/arm-fullhanv3-linux-uclibcgnueabi-gcc" \
GCC="/opt/fullhan/toolchain/arm-fullhanv3-linux-uclibcgnueabi-b6/bin/arm-fullhanv3-linux-uclibcgnueabi-gcc" \
CPP="/opt/fullhan/toolchain/arm-fullhanv3-linux-uclibcgnueabi-b6/bin/arm-fullhanv3-linux-uclibcgnueabi-cpp" \
CXX="/opt/fullhan/toolchain/arm-fullhanv3-linux-uclibcgnueabi-b6/bin/arm-fullhanv3-linux-uclibcgnueabi-g++" \
FC="/opt/fullhan/toolchain/arm-fullhanv3-linux-uclibcgnueabi-b6/bin/arm-fullhanv3-linux-uclibcgnueabi-gfortran" \
RANLIB="/opt/fullhan/toolchain/arm-fullhanv3-linux-uclibcgnueabi-b6/bin/arm-fullhanv3-linux-uclibcgnueabi-ranlib" \
STRIP="/opt/fullhan/toolchain/arm-fullhanv3-linux-uclibcgnueabi-b6/bin/arm-fullhanv3-linux-uclibcgnueabi-strip" \
OBJCOPY="/opt/fullhan/toolchain/arm-fullhanv3-linux-uclibcgnueabi-b6/bin/arm-fullhanv3-linux-uclibcgnueabi-objcopy" \
OBJDUMP="/opt/fullhan/toolchain/arm-fullhanv3-linux-uclibcgnueabi-b6/bin/arm-fullhanv3-linux-uclibcgnueabi-objdump" \
./configure  \
	--host=arm-unknown-none\
	--build=i686-pc-linux-gnu \
	--prefix=/opt/fullhan/toolchain/arm-fullhanv3-linux-uclibcgnueabi-b6/arm-fullhanv3-linux-uclibcgnueabi/sysroot/usr  \
	--prefix=/opt/fullhan/toolchain/arm-fullhanv3-linux-uclibcgnueabi-b6/arm-fullhanv3-linux-uclibcgnueabi/sysroot/usr  \
	-enable-shared --enable-static \
         --without-ssl  --without-librtmp   \
	 --disable-ldap  --disable-rtsp  --disable-dict --disable-smtp  --disable-manual \
          --disable-gopher   --disable-ipv6 --disable-openssl-auto-load-config --disable-sspi  --disable-crypto-auth    \
		  --disable-imap  --disable-ldaps --disable-pop3 --disable-proxy  --disable-telnet --disable-tftp --disable-zlib --without-ca-bundle --without-gnutls --without-libidn  --without-libssh2 --without-nss --without-zlib
 
  else
  echo "Please make sure the positon variable is start or stop."
fi

make clean 
make 

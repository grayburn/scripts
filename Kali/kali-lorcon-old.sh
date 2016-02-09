#!/bin/bash
git clone https://github.com/grayburn/lorcon-old.git
wget https://www.infradead.org/~tgr/libnl/files/libnl-1.1.4.tar.gz
tar -zxvf libnl-1.1.4.tar.gz
cd libnl-1.1.4
./configure
make
make install
cd ../lorcon-old
./configure
make
make install
ln -s /usr/local/lib/liborcon-1.0.0.so /usr/lib/liborcon-1.0.0.so
ln -s /usr/local/lib/libnl.so.1 /usr/lib/libnl.so.1

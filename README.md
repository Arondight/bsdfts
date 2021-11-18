# fts -- traverse a file hierarchy

## ABOUT

This is a port of the fts library on FreeBSD to Linux.

## USAGE

```sh
git clone https://github.com/Arondight/fts.git
cd ./fts/
make
stat ./libfts.so
```

## TEST

```sh
gcc -Wall -L. -l:./libfts.so ./test.c -o /tmp/fts_test
LD_LIBRARY_PATH=. /tmp/fts_test
```

## LICENSE

[BSD 3-Clause License](LICENSE).


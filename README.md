# fts -- traverse a file hierarchy

## ABOUT

Porting of fts on FreeBSD to Linux

## USAGE

```sh
git clone https://github.com/Arondight/fts.git
cd ./fts/
make
sudo make install PREFIX=/usr/
man fts
```

## TEST

```sh
gcc -Wall -lfts ./test.c -o /tmp/fts_test
/tmp/fts_test
```

## LICENSE

[BSD 3-Clause License](LICENSE).


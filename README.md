# fts -- traverse a file hierarchy

## ABOUT

Porting of fts on FreeBSD to Linux

## USAGE

```sh
git clone https://github.com/Arondight/bsdfts.git
cd ./bsdfts/
make
sudo make install PREFIX=/usr/
man bsdfts
```

## TEST

```sh
gcc -Wall -lbsdfts ./test.c -o /tmp/bsdfts_test
/tmp/bsdfts_test
```

## LICENSE

[BSD 3-Clause License](LICENSE).


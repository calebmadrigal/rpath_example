# rpath_example

Example of how to set rpath with gcc.

`do_test` is compiled with rpath set to `test_lib`, so `libsquareit.so` will be searched for there.

### Usage

Compile

    make

Run

    cd test_bin
    ./do_test


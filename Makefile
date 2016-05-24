all: libsquareit.so do_test

libsquareit.so: squareit.c squareit.h
	gcc squareit.c -shared -o libsquareit.so
	mkdir -p test_lib
	cp libsquareit.so test_lib
	rm libsquareit.so

do_test: do_test.c
	#gcc do_test.c libsquareit.so -o do_test
	gcc do_test.c -L test_lib -lsquareit -Wl,-rpath=$(shell pwd)/test_lib -o do_test
	mkdir -p test_bin
	cp do_test test_bin

clean:
	rm -rf libsquareit.so do_test test_lib test_bin

.PHONY: all
.PHONY: clean
.PHONY: test

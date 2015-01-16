LDFLAGS=-fPIC -shared
CFLAGS=-Wall

all: reuseaddr.so reuseaddr32.so reuseaddrarmhf.so reuseaddrarmel.so

reuseaddr.so: reuseaddr_preload.c
	gcc $(LDFLAGS) $(CFLAGS) -o $@ $<

reuseaddr32.so: reuseaddr_preload.c
	gcc $(LDFLAGS) $(CFLAGS) -m32 -o $@ $<

reuseaddrarmhf.so: reuseaddr_preload.c
	arm-linux-gnueabihf-gcc $(LDFLAGS) $(CFLAGS) -o $@ $<

reuseaddrarmel.so: reuseaddr_preload.c
	arm-linux-gnueabi-gcc $(LDFLAGS) $(CFLAGS) -o $@ $<

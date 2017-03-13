TARGETS=reuseaddr_x86_64.so reuseaddr_x86.so reuseaddr_armhf.so reuseaddr_armel.so
LDFLAGS=-fPIC -shared -ldl
CFLAGS=-Wall

all: $(TARGETS)

reuseaddr_x86_64.so: reuseaddr_preload.c
	x86_64-linux-gnu-gcc $(CFLAGS) -o $@ $< $(LDFLAGS)

reuseaddr_x86.so: reuseaddr_preload.c
	x86_64-linux-gnu-gcc $(CFLAGS) -m32 -o $@ $< $(LDFLAGS)

reuseaddr_armhf.so: reuseaddr_preload.c
	arm-linux-gnueabihf-gcc $(CFLAGS) -o $@ $< $(LDFLAGS)

reuseaddr_armel.so: reuseaddr_preload.c
	arm-linux-gnueabi-gcc $(CFLAGS) -o $@ $< $(LDFLAGS)

clean:
	rm $(TARGETS)

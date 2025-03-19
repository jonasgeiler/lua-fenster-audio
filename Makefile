#
# !IMPORTANT!
# I created this file for CLion and it works on my machine, but you should rather use `luarocks make` to build the library.
# I really don't have any experience with Makefiles, so I can't guarantee that it will work on your machine.
#

all: fenster.so

LD ?= gcc
LDFLAGS ?= -shared
X11_LIBDIR ?= /usr/lib64
fenster.so: src/main.o
	$(LD) $(LDFLAGS) $(LIBFLAG) -o $@ $< -L$(X11_LIBDIR) -lX11

CC ?= gcc
CFLAGS ?= -O2 -fPIC
LUA_INCDIR ?= /usr/include
X11_INCDIR ?= /usr/include
src/main.o: src/main.c
	$(CC) $(CFLAGS) -I$(LUA_INCDIR) -c $< -o $@ -I$(X11_INCDIR)

clean:
	rm -f src/main.o fenster.so
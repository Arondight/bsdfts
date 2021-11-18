CC	= gcc
RM	= rm -rf
CFLAGS	= -iquote ./include/ -std=gnu99 -fPIC -Wall -Wextra -O3
LDFLAGS	= -shared

TARGETS	= ./libfts.so
SOURCES	= ./lib/libc/gen/fts.c
HEADERS	= ./include/fts.h
OBJECTS	= $(SOURCES:.c=.o)

.PHONY: all
all: $(TARGETS)

$(TARGETS): $(OBJECTS)
	$(CC) ${LDFLAGS} -o $@ $^

$(SOURCES:.c=.d):%.d:%.c
	$(CC) $(CFLAGS) -MM $< >$@

include $(SOURCES:.c=.d)

.PHONY: clean
clean:
	-${RM} ${TARGETS} ${OBJECTS} $(SOURCES:.c=.d)


PREFIX	= /usr/local

CC	= gcc
RM	= rm -f
INST	= install -D
CFLAGS	= -iquote ./include/ -std=gnu99 -fPIC -Wall -Wextra -O3
LDFLAGS	= -shared

SOURCES	= ./lib/libc/gen/fts.c
OBJECTS	= $(SOURCES:.c=.o)
TARGETS	= ./lib$(notdir $(OBJECTS:.o=.so))
HEADERS	= ./include/fts.h
MANPAGE	= ./lib/libc/gen/fts.3
MANZIP	= $(notdir $(addsuffix .gz, $(MANPAGE)))


.PHONY: all
all: $(TARGETS) $(MANZIP)

$(SOURCES:.c=.d):%.d:%.c
	$(CC) $(CFLAGS) -MM $< >$@

include $(SOURCES:.c=.d)

$(TARGETS): $(OBJECTS)
	$(CC) ${LDFLAGS} -o $@ $^

$(MANZIP): $(MANPAGE)
	gzip -c $^ >$@


.PHONY: install
install:
	for lib in $(TARGETS); do	\
		$(INST) -m0755 $${lib} "$(DESTDIR)${PREFIX}/lib64/";	\
	done

	$(INST) -m0644 $(MANZIP) "$(DESTDIR)${PREFIX}/share/man/man3/"


.PHONY: clean
clean:
	-${RM} ${TARGETS} ${OBJECTS} $(SOURCES:.c=.d) $(MANZIP)

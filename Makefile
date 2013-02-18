# Makefile for repo-make.

DESTDIR=
PREFIX=/usr/local
MANDIR=$(PREFIX)/share/man
BINDIR=$(PREFIX)/sbin
VERSION=$(shell sed -rn 's/.*\$$VERSION = .(.+?).;$$/\1/p' repo-make)

.PHONY: all install uninstall clean dist

all: repo-make.1 repo-make.conf.5
repo-make.1: repo-make; pod2man $< $@
repo-make.conf.5: repo-make.conf.pod; pod2man $< $@

install: all
	mkdir -p $(DESTDIR)$(MANDIR)/man1
	gzip -c repo-make.1 > $(DESTDIR)$(MANDIR)/man1/repo-make.1.gz
	mkdir -p $(DESTDIR)$(MANDIR)/man5
	gzip -c repo-make.conf.5 > $(DESTDIR)$(MANDIR)/man5/repo-make.conf.5.gz
	install -D -m 755 repo-make $(DESTDIR)$(BINDIR)/repo-make

uninstall:
	rm -f $(DESTDIR)$(BINDIR)/repo-make
	rm -f $(DESTDIR)$(MANDIR)/man1/repo-make.1.gz
	rm -f $(DESTDIR)$(MANDIR)/man5/repo-make.conf.5.gz

clean:
	@rm -f repo-make.1
	@rm -f repo-make.conf.5
	@rm -f repo-make-*.tar.xz

dist: clean
	@tar --transform="s#^#repo-make-$(VERSION)/#" \
	--owner=0 --group=0 \
	-vcJf repo-make-$(VERSION).tar.xz *
	@echo "Distribution archive 'repo-make-$(VERSION).tar.xz' generated"

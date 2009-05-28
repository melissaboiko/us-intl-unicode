PREFIX = /usr
X11DIR = $(PREFIX)/share/X11
SYMDIR = $(X11DIR)/xkb/symbols

TARGET = $(SYMDIR)/us

all:
	@echo "Usage:"
	@echo "make install/install-ln/uninstall: general version"
	@echo "make divert/divert-ln/undivert: Debian/Ubuntu version"


install:
	cp -ab $(TARGET) $(TARGET).orig
	install -m 0644 us $(TARGET)
install-ln:
	cp -ab $(TARGET) $(TARGET).orig
	ln -sf `pwd`/us $(TARGET)
uninstall:
	cp -a $(TARGET).orig $(TARGET)
	rm $(TARGET).orig

divert:
	dpkg-divert --rename --add --local --divert $(TARGET).distrib $(TARGET)
	install -m 0644 us $(TARGET)
divert-ln:
	dpkg-divert --rename --add --local --divert $(TARGET).distrib $(TARGET)
	ln -sf `pwd`/us $(TARGET)
undivert:
	rm $(TARGET)
	dpkg-divert --remove $(TARGET)
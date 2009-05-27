PREFIX = /usr
X11DIR = $(PREFIX)/share/X11
SYMDIR = $(X11DIR)/xkb/symbols

TARGET = $(SYMDIR)/us

all:
	@echo "Usage:"
	@echo "make install, make uninstall: general versions"
	@echo "make divert, make undivert: Debian/Ubuntu version"

install:
	cp -ab $(TARGET) $(TARGET).orig
	install -m 0644 us $(TARGET)
uninstall:
	cp -a $(TARGET).orig $(TARGET)
	rm $(TARGET).orig
divert:
	dpkg-divert --rename --add --local --divert $(TARGET).distrib $(TARGET)
	install -m 0644 us $(TARGET)
undivert:
	dpkg-divert --remove $(TARGET)
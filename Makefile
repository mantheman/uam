
DESTDIR		= 
SCRIPTDIR	= /lib/udev/uam
CONFIGDIR	= /etc/udev
RULESDIR	= /etc/udev/rules.d

SCRIPTS		= uam-mount.sh uam-umount.sh
SCRIPTS_NX	= uam-common.sh
UDEV_RULES	= 10-uam.rules

all:
	@echo "There is no 'make', just 'make install' and have fun."

clean:
	true

distclean:
	true

install:
	mkdir -p $(DESTDIR)$(SCRIPTDIR) $(DESTDIR)$(CONFIGDIR) $(DESTDIR)$(RULESDIR)
	install -m700 $(SCRIPTS) $(DESTDIR)$(SCRIPTDIR)/
	install -m600 $(SCRIPTS_NX) $(DESTDIR)$(SCRIPTDIR)/
	install -m600 $(UDEV_RULES) $(DESTDIR)$(RULESDIR)/

uninstall:
	rm -f $(addprefix $(DESTDIR)$(SCRIPTDIR)/,$(SCRIPTS) $(SCRIPTS_NX))
	rm -f $(addprefix $(DESTDIR)$(RULESDIR)/,$(UDEV_RULES))
	rmdir -p --ignore-fail-on-non-empty $(DESTDIR)$(SCRIPTDIR) $(DESTDIR)$(CONFIGDIR) $(DESTDIR)$(RULESDIR)

.PHONY: all clean distclean install uninstall

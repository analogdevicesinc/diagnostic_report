PREFIX ?= /usr/local
DEB_BUILD ?=0# default: manual install mode

.PHONY : all
all: adi-diagnostic-report.desktop

%.desktop: %.desktop.in
	sed 's/@PREFIX@/$(subst /,\/,$(PREFIX))/' $+ > $@

.PHONY : clean
clean:
	rm -f adi-diagnostic-report.desktop

install: all
	install -d $(DESTDIR)$(PREFIX)/bin
	install -d $(DESTDIR)$(PREFIX)/share/adi_diagnostic_report/
	install ./adi_diagnostic_report $(DESTDIR)$(PREFIX)/bin/
	install ./adi_diagnostic_report.glade $(DESTDIR)$(PREFIX)/share/adi_diagnostic_report/
ifeq ($(DEB_BUILD),0)
	xdg-desktop-menu install adi-diagnostic-report.desktop
else
	install -d $(DESTDIR)$(PREFIX)/share/applications/
	install -m 644 ./adi-diagnostic-report.desktop \
		$(DESTDIR)/usr/share/applications/
endif

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/adi_diagnostic_report
	rm -rf $(DESTDIR)$(PREFIX)/share/adi_diagnostic_report/
ifeq ($(DEB_BUILD),0)
	xdg-desktop-menu uninstall adi-diagnostic-report.desktop
else
	rm -f $(DESTDIR)$(PREFIX)/share/applications/adi-diagnostic-report.desktop
endif


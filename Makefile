sources := $(shell git ls-files dot)

none:
	@echo "Type:"
	@echo "  make install"
	@echo "Sources available:"
	@$(foreach src,$(sources),echo "  $(src)";)

target    = ~/$(subst dot/,.,$(source))
dirname   = $(dir $(target))
checkdir  = ! test -d $(dirname)
mkdir     = $(checkdir) && install -d $(dirname)
status    = printf "%s ... " $(target)
install   = $(status) && install -m 644 -p $(source) $(target) && echo ok || echo fail
uninstall = $(status) && rm $(target) 2>/dev/null 	 && echo ok || echo fail

install: $(sources)
	@$(foreach source,$^, $(mkdir); $(install);)

uninstall: $(sources)
	@$(foreach source,$^, $(uninstall);)

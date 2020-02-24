default:: help

git  = $$(command -v git)
grep = $$(command -v grep)
cut  = $$(command -v cut)

install.status()    = printf "%s ... " ${file.target}
install.ok()        = echo ok
install.fail()      = echo fail
install.directory() = install -d $(dir ${file.target})
install.file()      = ${install.status()} && cp ${file.source} ${file.target} && ${install.ok()} || ${install.fail()}
install.files()     = $(foreach file.source, ${install.source.files}, ${install.directory()}; ${install.file()})

install.source.directory = $(@:install.%=%)
install.source.files     = $(shell $(git) ls-files ${install.source.directory})

file.target = ${HOME}/$(subst ${install.source.directory}/,.,${file.source})

#? # Install Python environment
#?
#? 	$ make install.python
#?
install.python:
	@${install.files()}

#? # Install Ruby environment
#?
#? 	$ make install.ruby
#?
rbenv.home    = ${HOME}/.rbenv
rbenv.plugins = ${rbenv.home}/plugins
rbenv.install() = $(git) clone https://github.com/rbenv/rbenv.git ${rbenv.home}
rbenv.ruby-build.home = ${rbenv.plugins}/ruby-build
rbenv.ruby-build.install() = $(git) clone https://github.com/rbenv/ruby-build.git ${rbenv.ruby-build.home}

install.ruby:
	@test -d ${rbenv.home} || ${rbenv.install()}
	@test -d ${rbenv.ruby-build.home} || ${rbenv.ruby-build.install()}
	@${install.files()}

help:
	@echo From Makefile
	@echo
	@$(grep) '^#?' Makefile | $(cut) -c4- 

#find $(@:install.%=%) -mindepth 1 -type d | sed "s|$(@:install.%=%)/|${HOME}/.|g" | xargs mkdir -p

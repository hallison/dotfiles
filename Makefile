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

#? # Install Ruby environment
#?
#? 	$ make install.ruby
#?
rbenv.install() = $(git) clone https://github.com/rbenv/rbenv.git ${rbenv.home}

rbenv.home    = ${HOME}/.rbenv
rbenv.plugins = ${rbenv.home}/plugins

rbenv.ruby-build.install() = $(git) clone https://github.com/rbenv/ruby-build.git ${rbenv.ruby-build.home}

rbenv.ruby-build.home = ${rbenv.plugins}/ruby-build

install.ruby:
	@test -d ${rbenv.home} || ${rbenv.install()}
	@test -d ${rbenv.ruby-build.home} || ${rbenv.ruby-build.install()}
	@${install.files()}

#? # Install Python environment
#?
#? 	$ make install.python
#?
pyenv.install() = $(git) clone https://github.com/pyenv/pyenv.git ${pyenv.home}

pyenv.home    = ${HOME}/.pyenv
pyenv.plugins = ${pyenv.home}/plugins

install.python:
	@test -d ${pyenv.home} || ${pyenv.install()}
	@${install.files()}

help:
	@echo From Makefile
	@echo
	@$(grep) '^#?' Makefile | $(cut) -c4- 

#find $(@:install.%=%) -mindepth 1 -type d | sed "s|$(@:install.%=%)/|${HOME}/.|g" | xargs mkdir -p

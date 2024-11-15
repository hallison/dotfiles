default:: help

git  = $(shell command -v git)
grep = $(shell command -v grep)
cut  = $(shell command -v cut)
curl = $(shell command -v curl)

install.status()    = printf "%s ... " ${file.target}
install.ok()        = echo ok
install.fail()      = echo fail
install.directory() = (test -d $(dir ${file.target}) || install -d $(dir ${file.target}))
install.file()      = (${install.status()} && cp ${file.source} ${file.target} && ${install.ok()} || ${install.fail()})
install.files()     = $(foreach file.source, ${install.source.files}, ${install.directory()}; ${install.file()};)

install.source.directory = $(@:install.%=%)
install.source.files     = $(shell $(git) ls-files ${install.source.directory})

file.target = ${HOME}/${file.source:${install.source.directory}/%=.%}

#? # Install Bash
#?
#?	$ make install.bash
#?
install.bash:
	@${install.files()}

#? # Install Git environment
#?
#?	$ make install.git
#?
install.git:
	@${install.files()}

#? # Install Vim environment and configurations
#?
#?	$ make install.vim
#?
install.vim:
	$(curl) -fLo vim/vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	@${install.files()}

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

#? # Install NodeJS environment
#?
#?	$ make install.nodejs
#?
nodenv.install() = $(git) clone https://github.com/nodenv/nodenv.git ${nodenv.home}

nodenv.home    = ${HOME}/.nodenv
nodenv.plugins = ${nodenv.home}/plugins

nodenv.node-build.install() = $(git) clone https://github.com/nodenv/node-build.git ${nodenv.node-build.home}

nodenv.node-build.home = ${nodenv.plugins}/node-build

install.nodejs:
	@test -d ${nodenv.home} || ${nodenv.install()}
	@test -d ${nodenv.node-build.home} || ${nodenv.node-build.install()}
	@${install.files()}

#? # Install Go environment
#?
#?	$ make install.go
#?
goenv.install() = $(git) clone https://github.com/syndbg/goenv.git ${goenv.home}

goenv.home    = ${HOME}/.goenv
goenv.plugins = ${goenv.home}/plugins

install.go:
	@test -d ${goenv.home} || ${goenv.install()}
	@${install.files()}

#? # Install Python environment
#?
#?	$ make install.python
#?
pyenv.install() = $(git) clone https://github.com/pyenv/pyenv.git ${pyenv.home}

pyenv.home    = ${HOME}/.pyenv
pyenv.plugins = ${pyenv.home}/plugins

install.python:
	@test -d ${pyenv.home} || ${pyenv.install()}
	@${install.files()}

#? # Install Java environment
#?
#?	$ make install.java
#?
jenv.install() = $(git) clone https://github.com/gcuisinier/jenv.git ${jenv.home}

jenv.home    = ${HOME}/.jenv
jenv.plugins = ${jenv.home}/plugins

install.java:
	@test -d ${jenv.home} || ${jenv.install()}
	@${install.files()}

help:
	@echo From Makefile
	@echo
	@$(grep) '^#?' Makefile | $(cut) -c4- 

#find $(@:install.%=%) -mindepth 1 -type d | sed "s|$(@:install.%=%)/|${HOME}/.|g" | xargs mkdir -p

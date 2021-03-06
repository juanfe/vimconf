# Intallation

Copy .vimrc and .vim in the home directory.

```sh
cp .vimrc ~
cp .vim ~ -r
```

The packages to install are

```sh
apt-get install git vim-latexsuite  vim-vimoutliner exuberant-ctags
```

and

```sh
git clone https://github.com/gmarik/vundle ~/.vim/bundle/Vundle.vim
```

see the ~/.vim/bundle/Vundle.vim/README.md to configure .vimrc

## Installing plugins

after that you can run vim and run

:PluginInstall

## Enbling python capabilities

After doing this, it is possible that you need to compile vim to enable python capabilities, if so, you can do it by:

```sh
sudo apt-get remove --auto-remove vim
sudo apt-get build-dep vim
apt-get source vim
cd vim-*  # it will be vim-7.4.something
```

Edit debian/rules and replace:

```sh
ALLINTERPFLAGS+=--enable-pythoninterp --with-python-config-dir=$(shell python-config --configdir)
ALLINTERPFLAGS+=--disable-python3interp
```

or

```sh
ALLINTERPFLAGS+=--enable-python3interp --with-python3-config-dir=$(shell python3-config --configdir)
ALLINTERPFLAGS+=--disable-pythoninterp
```

With:

```sh
ALLINTERPFLAGS+=--enable-pythoninterp=dynamic --with-python-config-dir=$(shell python-config --configdir)
ALLINTERPFLAGS+=--enable-python3interp=dynamic --with-python3-config-dir=$(shell python3-config --configdir)
```

In case of using Ruby2.0 instead Ruby, change it in config in debian/control:

```sh
# Update d/rules when ruby version changes
 libperl-dev, tcl-dev, python-dev, ruby2.0, ruby2.0-dev, lua5.2,
  liblua5.2-dev
```

Then run:

```sh
sudo apt-get install python3-dev python-dev
cd ..
./configure
sudo dpkg-buildpackage -us -j4
```

Have lunch. (Or tea if you used -j $(nproc).)

Now, multiple .deb files will have been created in the parent directory. To see which:

```sh
cd ..
ls vim*.deb
```

Along with the particular variant you want to install (vim, vim-gnome, vim-gtk, etc.), you'll have to install vim-common_*.deb, vim-runtime_*.deb, and for the GUI versions, vim-gui-common_*.deb. For example, with vim-gnome, and the current version of vim in the repositories:

```sh
cd ..
sudo dpkg -i vim-runtime_XXXX_all.deb
sudo dpkg -i vim-common_XXXX_all.deb
sudo dpkg -i vim_XXXX_amd64.deb
sudo dpkg -i vim-gui-common_XXXX_all.deb
sudo dpkg -i vim-doc_XXXX_all.deb
sudo dpkg -i vim-gtk_XXXX_amd64.deb
sudo dpkg -i vim-gnome_XXXX_all.deb vim-common_XXXX_all.deb
```

vim-tiny is like vi, and vim-nox is a version that I have been never used.

Then:

```sh
$ vim --version | grep python
+cryptv          +linebreak       +python/dyn      +viminfo
+cscope          +lispindent      +python3/dyn     +vreplace
```

The pi-rho/dev PPA builds Vim in this fashion, so you can use the PPA instead of manually building it.

## Ctags

To install ctags for Ruby, use:

```sh
gem install ripper-tags
```

This gem is useful to create a tags file to follow the code.

After that, create the tags file within the project:

```sh
cd your_project/
riper-tags -R
```

## Vundle

To install the vundle run inside vim:

```sh
Launch vim and run :PluginInstall
```

See [1]

[1] https://github.com/VundleVim/Vundle.vim

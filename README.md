# Intallation

Copy .vimrc and .vim in the home directory.

```
cp .vimrc ~
cp .vim ~ -r
```

The packages to install are
```
apt-get install vim-latexsuite  vim-vimoutliner exuberant-ctags
```

and

```
git clone https://github.com/gmarik/vundle ~/.vim/bundle/Vundle.vim
```

see the ~/.vim/bundle/Vundle.vim/README.md to configure .vimrc

## Installing plugins

after that you can run vim and run

:PluginInstall

## Enbling python capabilities

After doing this, it is possible that you need to compile vim to enable python capabilities, if so, you can do it by:

```
sudo apt-get remove --auto-remove vim
sudo apt-get build-dep vim
apt-get source vim
cd vim-*  # it will be vim-7.4.something
```

Edit debian/rules and replace:

```
ALLINTERPFLAGS+=--enable-pythoninterp --with-python-config-dir=$(shell python-config --configdir)
ALLINTERPFLAGS+=--disable-python3interp
```

With:

```
ALLINTERPFLAGS+=--enable-pythoninterp=dynamic --with-python-config-dir=$(shell python-config --configdir)
ALLINTERPFLAGS+=--enable-python3interp=dynamic --with-python3-config-dir=$(shell python3-config --configdir)
```

Then run:

```
dpkg-buildpackage -us
```

Have lunch. (Or tea if you used -j $(nproc).)

Now, multiple .deb files will have been created in the parent directory. To see which:

```
cd ..
ls vim*.deb
```

Along with the particular variant you want to install (vim, vim-gnome, vim-gtk, etc.), you'll have to install vim-common_*.deb, vim-runtime_*.deb, and for the GUI versions, vim-gui-common_*.deb. For example, with vim-gnome, and the current version of vim in the repositories:

```
sudo dpkg -i vim-gtk3_8.0.0134-1_amd64.deb
sudo dpkg -i vim-gnome_8.0.0134-1_all.deb vim-common_8.0.0134-1_all.deb vim-gui-common_8.0.0134-1_all.deb vim-runtime_8.0.0134-1_all.deb
```

Then:

```
$ vim --version | grep python
+cryptv          +linebreak       +python/dyn      +viminfo
+cscope          +lispindent      +python3/dyn     +vreplace
```

The pi-rho/dev PPA builds Vim in this fashion, so you can use the PPA instead of manually building it.

## Ctags

To install ctags for Ruby, use:

```
gem install ripper-tags
```

This gem is useful to create a tags file to follow the code.

After that, create the tags file within the project:

```
cd your_project/
riper-tags -R
```



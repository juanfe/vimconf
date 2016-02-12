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

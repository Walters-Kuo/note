### Bash ###
echo 'export PATH=$PATH:~/.local/bin' >>~/.bashrc
source ~/.bashrc
echo $PATH

### Zsh ###
echo 'export PATH=$PATH:~/.local/bin' >>~/.zshrc
source ~/.zshrc
echo $PATH
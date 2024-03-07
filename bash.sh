### Zsh ###
echo 'export PATH=$PATH:~/.local/bin' >>~/.zshrc
source ~/.zshrc
echo $PATH

//cih.sh sample code
#!/bin/bash
function my_func()
{
    var=$RANDOM
}
my_func

//for debug
$ (exec 111> log ; export SHELLOPTS BASH_XTRACEFD=111 PS4='($BASH_SOURCE:$LINENO:$FUNCNAME): ' ; set -x ; ./cih.sh)

$ cat log
(:1:): ./cih.sh
(./cih.sh:8:): my_func
(./cih.sh:5:my_func): var=21742


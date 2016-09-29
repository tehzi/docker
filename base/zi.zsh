PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/home/zi/bin:/usr/local/bin:/home/zi/project/other/go/bin:

export TERM=xterm-256color


setopt GLOB_COMPLETE
setopt EXTENDED_GLOB

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:*:kill:*:processes' command 'ps --forest -A -o pid,user,cmd'
zstyle ':completion:*:processes-names' command 'ps axho command'

autoload -Uz vcs_info


hash -d proj=/home/zi/project/
hash -d p=/home/zi/project/active/
hash -d other=/home/zi/project/other/
hash -d www=/home/www/
hash -d html=/home/zi/project/html/
hash -d conf=/home/zi/conf/
hash -d build=/home/zi/Projects/build/
hash -d prog='/home/zi/Документы/Linux/Программы'
hash -d slices='/home/zi/project/html/slices/images/'
hash -d desktop='/home/zi/Рабочий стол/'
hash -d ya=/mnt/yandex
hash -d localhost=/home/www/docs/localhost
hash -d s=/mnt/sites
hash -d d='/home/zi/Загрузки/'
hash -d dp='/home/zi/Рабочий стол'
hash -d archive='/home/zi/project/archive'

pk () {
	if [ $1 ] ; then
		case $1 in
			tbz)       tar cjvf $2.tar.bz2 $2      ;;
			tgz)       tar czvf $2.tar.gz  $2       ;;
			tar)       tar cpvf $2.tar  $2       ;;
			bz2)       bzip $2 ;;
			gz)        gzip -c -9 -n $2 > $2.gz ;;
			zip)       zip -r $2.zip $2   ;;
			7z)        7z a $2.7z $2    ;;
			rar)       rar a $2.rar $2  ;;
			*)         echo "'$1' cannot be packed via pk()" ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}


extract () {
	if [ -f $1 ] ; then
 		case $1 in
			*.tar.bz2)   tar xjf $1        ;;
			*.tar.gz)    tar xzf $1     ;;
			*.bz2)       bunzip2 $1       ;;
			*.rar)       unrar x $1     ;;
			*.gz)        gunzip $1     ;;
			*.tar)       tar xf $1        ;;
			*.tbz2)      tar xjf $1      ;;
			*.tgz)       tar xzf $1       ;;
			*.zip)       unzip $1     ;;
			*.Z)         uncompress $1  ;;
			*.7z)        7z x $1    ;;
			*.tbz)       tar xjvf  ;;
			*)           echo "я не в курсе как распаковать '$1'..." ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}

alias ll='ls -alh --color=auto'
alias nbo="netbeans --open"
alias pl="print -l"
# alias scp="sshpass -e scp"

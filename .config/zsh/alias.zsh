# generic
alias apt='sudo apt'
alias pacman='sudo pacman'
alias g='git'
alias ls='ls --color=auto --group-directories-first'
alias feh='feh --image-bg black'
alias vim='nvim'
alias tree='tree -L 2 --noreport'

# mpv offshoots
alias mpi='mpv -profile image'
alias mpa='mpv -profile music'

# recorder
alias deskrec='ffmpeg -video_size 1920x1080 -framerate 30 -f x11grab -i :0.0 -c:v libvpx -qp 0 -preset ultrafast capture.webm'

# manage configuration
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

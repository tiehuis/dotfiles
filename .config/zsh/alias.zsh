# generic
alias apt='sudo apt'
alias pacman='sudo pacman'
alias ls='ls --color=auto --group-directories-first'
alias feh='feh --image-bg black'
alias vim='nvim'
alias cower='cower -t ~/aur'
alias cut='cut -d" "'

# mpv offshoots
alias mpi='mpv -profile image'
alias mpa='mpv -profile music'

# recorder
alias deskrec='ffmpeg -video_size 1920x1080 -framerate 30 -f x11grab -i :0.0 -c:v libvpx -qp 0 -preset ultrafast capture.webm'

# Manage configuration
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

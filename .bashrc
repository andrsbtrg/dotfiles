# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc
. "$HOME/.cargo/env"

# alias code='code --ozone-platform=wayland --enable-features=WaylandWindowDecorations'

# to open files
alias open='xdg-open'

# Long format list
alias ll="ls -la"

# Print my public IP
alias myip='curl ipinfo.io/ip'

function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working tree clean" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/(\1$(parse_git_dirty))/"
}

# export PS1='\[\e[32;1m\]\A\[\e[0m\] \[\e[34;1m\]\w\[\e[0;32;2m\] $(parse_git_branch)\[\e[0m\]\\$'
PROMPT_COMMAND='PS1_CMD1=$(parse_git_branch)'; PS1=' \[\e[32m\]\w\[\e[2m\] \[\e[0;91m\]${PS1_CMD1}\[\e[0m\]\\$'
export PATH=$PATH:/home/andres/.spicetify

alias spotify='flatpak run com.spotify.Client'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

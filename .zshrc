# /$$$$$$$             /$$$$$$  /$$                                  /$$                                            /$$$$$$  /$$          
#| $$__  $$           /$$__  $$| $/                                 | $$                                           /$$__  $$|__/          
#| $$  \ $$  /$$$$$$ | $$  \__/|_//$$$$$$$       /$$$$$$$$  /$$$$$$$| $$$$$$$         /$$$$$$$  /$$$$$$  /$$$$$$$ | $$  \__/ /$$  /$$$$$$ 
#| $$$$$$$/ |____  $$| $$$$      /$$_____/      |____ /$$/ /$$_____/| $$__  $$       /$$_____/ /$$__  $$| $$__  $$| $$$$    | $$ /$$__  $$
#| $$__  $$  /$$$$$$$| $$_/     |  $$$$$$          /$$$$/ |  $$$$$$ | $$  \ $$      | $$      | $$  \ $$| $$  \ $$| $$_/    | $$| $$  \ $$
#| $$  \ $$ /$$__  $$| $$        \____  $$        /$$__/   \____  $$| $$  | $$      | $$      | $$  | $$| $$  | $$| $$      | $$| $$  | $$
#| $$  | $$|  $$$$$$$| $$        /$$$$$$$/       /$$$$$$$$ /$$$$$$$/| $$  | $$      |  $$$$$$$|  $$$$$$/| $$  | $$| $$      | $$|  $$$$$$$
#|__/  |__/ \_______/|__/       |_______/       |________/|_______/ |__/  |__/       \_______/ \______/ |__/  |__/|__/      |__/ \____  $$
#                                                                                                                                /$$  \ $$
#                                                                                                                               |  $$$$$$/
#                                                                                                                                \______/ 

# Theming section  
autoload -U compinit zcalc #colors
compinit -d
#colors
PS1="%B%F{31}[%f%b%B%F{49}%n%f%b%B%F{31}] %f%b%B%F{49}>%f%b%B%F{31}> %f%b%B%F{24}%1d%f%b%F{49} → %f"
stty stop undef		# Disable ctrl-s to freeze terminal.


# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

#Load alias file
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/aliasrc"

setopt autocd		                       # Automatically cd into typed directory.
setopt numericglobsort                 # Sort filenames numerically when it makes sense
setopt nobeep                          # No beep
setopt appendhistory                   # Immediately append history instead of overwriting

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case insensitive tab completion
#zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                              # automatically find new executables in path 

# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

WORDCHARS=${WORDCHARS//\/[&.;]} # Don't consider certain characters part of the word

bindkey '^[[3~' delete-char        # Delete key
bindkey '^[[C'  forward-char       # Right key
bindkey '^[[D'  backward-char      # Left key
# Navigate words with ctrl+arrow keys
bindkey '^[Oc' forward-word                                     #
bindkey '^[Od' backward-word                                    #
bindkey '^[[1;5D' backward-word                                 #
bindkey '^[[1;5C' forward-word                                  #
bindkey '^H' backward-kill-word                                 # delete previous word with ctrl+backspace


export PATH=/etc/demonsaw:$PATH
export DENO_INSTALL="/home/raf/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
#export PATH="$HOME/.dynamic-colors/bin:$PATH"


# Use syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#source $HOME/.dynamic-colors/completions/dynamic-colors.zsh
#test -r "~/.dir_colors" && eval $(dircolors ~/.dir_colors)

alias mon2cam="deno run --unstable -A -r -q https://raw.githubusercontent.com/ShayBox/Mon2Cam/master/src/mod.ts"

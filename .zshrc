# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
export DEBUGINFOD_URLS="https://debuginfod.archlinux.org"
export RANGER_DEVICONS_SEPARATOR="  "

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/.local/bin:$HOME/bin:/usr/local/bin:$PATH
export NODE_PATH=$NODE_PATH:$HOME/.nvm/versions/node/v17.9.1/lib/node_modules
export PATH="$PATH":"$HOME/.pub-cache/bin"

export JAVA_HOME=$HOME/softs/jdk-18.0.2.1

# Colors
export BASE00="#1c1f21"
export BASE01="#393d40"
export BASE02="#555a5f"
export BASE03="#72777c"
export BASE04="#a9aeb2"
export BASE05="#c3c7ca"
export BASE06="#dbdee0"
export BASE07="#f0f1f2"
export BASE08="#82bce8"
export BASE09="#8289e8"
export BASE0A="#ae82e8"
export BASE0B="#e882bc"
export BASE0C="#e8ae82"
export BASE0D="#bce882"
export BASE0E="#82e8ae"
export BASE0F="#82e8e1"


# For using autojump
source /etc/profile

# Add node version created by nvm (not loading nvm bc it is too slow)
# source /usr/share/nvm/init-nvm.sh
export PATH=$HOME/.nvm/versions/node/v17.9.1/bin:$PATH

export C_INCLUDE_PATH=$C_INCLUDE_PATH:$HOME/.local/lib/python3.10/site-packages/numpy/core/include/
export C_INCLUDE_PATH=$C_INCLUDE_PATH:/usr/include/python3.10/
export C_INCLUDE_PATH=$C_INCLUDE_PATH:/usr/include/

# Add flutter to path
export PATH="$PATH:$HOME/softs/flutter/bin"

# Change default editor
export EDITOR=/usr/bin/nvim

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=12'

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git history-substring-search zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias v=nvim
alias vr="nvim ~/.vimrc"
alias vs="nvim -S .session.vim"
alias gdf="git --git-dir=$HOME/dotfiles --work-tree=$HOME"
alias vdf="GIT_DIR=$HOME/dotfiles GIT_WORK_TREE=$HOME nvim"
alias ranger=". ranger"
alias lg="lazygit"

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

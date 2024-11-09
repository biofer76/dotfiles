# ---------------------------------- #
#        Core Configuration          #
# ---------------------------------- #

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(
	zsh-autosuggestions
	git
	docker
	copyfile
	copybuffer
	copypath
	dirhistory
	macos
	virtualenv
	gcloud
)
source $ZSH/oh-my-zsh.sh

# ---------------------------------- #
#        User Configuration          #
# ---------------------------------- #

# kubernetes aliases
alias k=kubectl
complete -F __start_kubectl k

# Custom zsh
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1

# Virtual Env
export VIRTUAL_ENV_DISABLE_PROMPT=0
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status virtualenv)

# MySQL Client
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/fabio/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Golang
PATH="$PATH:$HOME/go/bin"

# Brew
PATH=/opt/homebrew/bin:$PATH

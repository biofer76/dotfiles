export ZSH="$HOME/.oh-my-zsh"

# Install oh-my-zsh if not installed
if [ ! -d "$ZSH" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# ---------------------------------- #
#        Core Configuration          #
# ---------------------------------- #

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
#          Configuration             #
# ---------------------------------- #

# Display short path
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1

# Display Prompt info
export VIRTUAL_ENV_DISABLE_PROMPT=0
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status virtualenv)

# Tell homebrew to not autoupdate every single time I run it (just once a week).
export HOMEBREW_AUTO_UPDATE_SECS=604800

# ---------------------------------- #
#             Aliases                #
# ---------------------------------- #

# Kubernetes aliases
alias k=kubectl
complete -F __start_kubectl k

# ---------------------------------- #
#             Commands               #
# ---------------------------------- #

# Enter a running Docker container.
function denter() {
  if [[ ! "$1" ]]; then
    echo "You must supply a container ID or name."
    return 0
  fi

  docker exec -it $1 bash
  return 0
}

# Delete a given line number in the known_hosts file.
knownrm() {
  re='^[0-9]+$'
  if ! [[ $1 =~ $re ]]; then
    echo "error: line number missing" >&2
  else
    sed -i '' "$1d" ~/.ssh/known_hosts
  fi
}

# ---------------------------------- #
#              PATHS                 #
# ---------------------------------- #

# MySQL Client
PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/fabio/Library/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) PATH="$PNPM_HOME:$PATH" ;;
esac

# Golang
PATH="$PATH:$HOME/go/bin"

# Brew
PATH=/opt/homebrew/bin:$PATH

export PATH

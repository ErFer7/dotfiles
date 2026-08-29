# Env
PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
PATH=$HOME/Executables:$PATH
PATH=/usr/lib/rustup/bin/:$PATH
PATH=$HOME/.cargo/bin:$PATH

# Path
export PATH=$PATH

# OMZ
export ZSH="$HOME/.oh-my-zsh"

# Go
export GOPATH="$HOME/Applications"

# Automatic
ZSH_THEME="half-life" # set by `omz`

# Plugins
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $HOME/.aliases
source $ZSH/oh-my-zsh.sh
source /usr/share/nvm/init-nvm.sh

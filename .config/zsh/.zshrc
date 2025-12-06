# brew setup
eval "$(/opt/homebrew/bin/brew shellenv)"

# starship setup
eval "$(starship init zsh)"

#volta setup
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# zsh plugins
source $HOME/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# python pip3 and online-judge-tools  setup
export PATH="/opt/homebrew/opt/python@3.9/bin:$PATH"
export PATH="$HOME/Library/Python/3.9/bin:$PATH"

# yazi setup
function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# secrets loading
if [ -f "$HOME/.config/zsh/.secret.zsh" ]; then
	source "$HOME/.config/zsh/.secret.zsh"
fi

# alias loading
source "$HOME/.config/zsh/.alias.zsh"
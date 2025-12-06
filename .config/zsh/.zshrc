###########################################
#                  PLUGINS                
###########################################
source $HOME/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


###########################################
#            SHELL CONFIGURATION               
###########################################
# secrets loadidng
if [ -f "$HOME/.config/zsh/.secret.zsh" ]; then
	source "$HOME/.config/zsh/.secret.zsh"
fi

# alias loading
source "$HOME/.config/zsh/.alias.zsh"

# local bin
export PATH=$PATH:$HOME/.local/bin

###########################################
#         APPLICATION CONFIGURATION          
###########################################
# 12aws
export PATH="/Users/kudoakiya/dev/lab/infras/12aws:$PATH"
# yazi
function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
# brew setup
eval "$(/opt/homebrew/bin/brew shellenv)"
# starship setup
eval "$(starship init zsh)"

###########################################
#       APPLICATION PATH SETTINGS          
###########################################
#volta setup
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
# Android Studio
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
# python
export PATH="/opt/homebrew/opt/python@3.9/bin:$PATH"
export PATH="$HOME/Library/Python/3.9/bin:$PATH"
# expo redirect test
EXPO_TUNNEL_SUBDOMAIN=com.anonymous.redirect_test_expo
# intellij idea
PATH=$PATH:/Applications/IntelliJ \IDEA \CE.app/Contents/MacOS
### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="$HOME/.rd/bin:$PATH"

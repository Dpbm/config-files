export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git gitignore)

source "$ZSH/oh-my-zsh.sh"
source "$HOME/.vars.sh"
source "$HOME/.aliases.sh"
source /opt/ros/jazzy/setup.zsh 
# source <(ng completion script)

BASE_FUNCTIONS_PATH="$HOME/.functions"
for function_file in $BASE_FUNCTIONS_PATH/*.sh; do
    chmod +x "$function_file"
    source "$function_file"
done

[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

__conda_setup="$('$HOME/.local/share/mise/installs/python/miniforge3-24.11.2-1/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/.local/share/mise/installs/python/miniforge3-24.11.2-1/etc/profile.d/conda.sh" ]; then
        . "$HOME/.local/share/mise/installs/python/miniforge3-24.11.2-1/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/.local/share/mise/installs/python/miniforge3-24.11.2-1/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "$HOME/.local/share/mise/installs/python/miniforge3-24.11.2-1/etc/profile.d/mamba.sh" ]; then
    . "$HOME/.local/share/mise/installs/python/miniforge3-24.11.2-1/etc/profile.d/mamba.sh"
fi


[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

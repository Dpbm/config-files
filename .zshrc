source "$HOME/.vars.sh"
source "$HOME/.aliases.sh"

BASE_FUNCTIONS_PATH="$HOME/.functions"
for function_file in $BASE_FUNCTIONS_PATH/*.sh; do
    chmod +x "$function_file"
    source "$function_file"
done

. "$HOME/.cargo/env"

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
#
eval "$(starship init zsh)"

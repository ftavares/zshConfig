# Characters
SEGMENT_SEPARATOR="\ue0b0"
PLUSMINUS="\u00b1"
BRANCH="\ue0a0"
DETACHED="\u27a6"
CROSS="\u2718"
LIGHTNING="\u26a1"
GEAR="\u2699"
LAMDA="\u03bb"

prompt_status() {
  local symbols
  symbols=()
  symbols+="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
  [[ $UID -eq 0 ]] && symbols+="%{%F{yellow}%}$LIGHTNING" 
  [[ -n "$symbols" ]] && echo $symbols
}

prompt_dir() {
    echo  "%{$fg[green]%}%~%{$reset_color%}"
}

prompt_context() {
    echo "%{$fg[cyan]%}%c%{$reset_color%}"
}

NEWLINE=$'\n'
FIRSTLINE() {
    echo '$(prompt_status) $(prompt_context) $(prompt_dir) $(git_prompt_info)'
}

SECONDLINE() {
    echo "%{$fg_bold[cyan]%}$LAMDA%{$reset_color%}"
}

PROMPT="$(FIRSTLINE)$NEWLINE$(SECONDLINE) "

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

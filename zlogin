local smiley="%(?,%{$fg[green]%}☺%{$reset_color%},%{$fg[red]%}☹%{$reset_color%})"

# adds the current branch name in green
git_prompt_info() {
  git rev-parse --git-dir &> /dev/null
  git_status="$(git status 2> /dev/null)"
  remote_pattern="# Your branch is (.*) of"
  diverge_pattern="# Your branch and (.*) have diverged"
  if [[ ! ${git_status} =~ "working directory clean" ]]; then
    state="%{$fg[red]%}⚡"
  fi
  # add an else if or two here if you want to get more specific
  if [[ ${git_status} =~ ${remote_pattern} ]]; then
    if [[ ${BASH_REMATCH[2]} == "ahead" ]]; then
      remote="%{$fg[yellow]%}↑"
    else
      remote="%{$fg[yellow]%}↓"
    fi
  fi
  if [[ ${git_status} =~ ${diverge_pattern} ]]; then
    remote="%{$fg[yellow]%}↕"
  fi
  ref=$(git symbolic-ref HEAD 2> /dev/null)
  if [[ -n $ref ]]; then
    echo "[%{$fg[green]%}${ref#refs/heads/}${remote}${state}%{$fg[yellow]%}%{$reset_color%}]"
  fi
}

# adds the current ruby in red
rvm_prompt_info() {
  ref=$(rvm-prompt 2> /dev/null)
  if [[ -n $ref ]]; then
    echo "%{$fg[red]%}$ref%{$reset_color%}"
  fi
}

# makes color constants available
autoload -U colors
colors

# enable colored output from ls, etc
export CLICOLOR=1

# expand functions in the prompt
setopt prompt_subst

# prompt
#export PS1='$(rvm_prompt_info) $(git_prompt_info)
#${smiley} %{$reset_color%}%~ %{$fg[magenta]%}∴ %{$reset_color%}'
PROMPT='${smiley} %{$reset_color%}%~ %{$fg[magenta]%}∴ %{$reset_color%}'
RPROMPT='$(rvm_prompt_info) $(git_prompt_info)'

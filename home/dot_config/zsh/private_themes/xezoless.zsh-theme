# kyogoi's theme
# Derived from:
#
# Michele Bologna's theme
# http://michelebologna.net
#
# This a theme for oh-my-zsh. Features a colored prompt with:
# * username@host: [jobs] [git] workdir % 
# * hostname color is based on hostname characters. When using as root, the 
# prompt shows only the hostname in red color.
# * [jobs], if applicable, counts the number of suspended jobs tty
# * [git], if applicable, represents the status of your git repo (more on that
# later)
# * '%' prompt will be green if last command return value is 0, yellow otherwise.
# 
# git prompt is inspired by official git contrib prompt: 
# https://github.com/git/git/tree/master/contrib/completion/git-prompt.sh
# and it adds:
# * the current branch
# * '%' if there are untracked files
# * '$' if there are stashed changes
# * '*' if there are modified files
# * '+' if there are added files
# * '<' if local repo is behind remote repo
# * '>' if local repo is ahead remote repo
# * '=' if local repo is equal to remote repo (in sync)
# * '<>' if local repo is diverged

local green="%{$fg_bold[green]%}"
local red="%{$fg_bold[red]%}"
local cyan="%{$fg_bold[cyan]%}"
local yellow="%{$fg_bold[yellow]%}"
local blue="%{$fg_bold[blue]%}"
local magenta="%{$fg_bold[magenta]%}"
local white="%{$fg_bold[white]%}"
local baby_blue="%{$FG[111]%}"
local reset="%{$reset_color%}"

local username_normal_color="%{$FG[169]%}"
local username_root_color=$red
local hostname_root_color=$red

# calculating hostname color with hostname characters
local -a hostname_color
hostname_color="%{$FG[176]%}"

local current_dir_color="%{$FG[177]%}"
local username_command="%n"
local hostname_command="%m"
local current_dir="%~"

local username_output="%(!..$username_normal_color$username_command$baby_blue@)"
local hostname_output="$hostname_color$hostname_command$reset"
local current_dir_output="$current_dir_color$current_dir$reset"
local jobs_bg="${red}fg: %j$reset"
local last_command_output="%{$FG[218]%}"

# plugin options: git
ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_UNTRACKED="$blue%%"
ZSH_THEME_GIT_PROMPT_MODIFIED="$red*"
ZSH_THEME_GIT_PROMPT_ADDED="$green+"
ZSH_THEME_GIT_PROMPT_STASHED="$blue$"
ZSH_THEME_GIT_PROMPT_EQUAL_REMOTE="$green="
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE=">"
ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE="<"
ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE="$red<>"

# plugin options: vi-mode
MODE_INDICATOR="$blue%%>"
INSERT_MODE_INDICATOR="$magenta#>"

PROMPT='$username_output$hostname_output:$current_dir_output%1(j. [$jobs_bg].)'
GIT_PROMPT='$(out=$(git_prompt_info)$(git_prompt_status)$(git_remote_status);if [[ -n $out ]]; then printf %s " $white($green$out$white)$reset";fi)'
PROMPT+="$GIT_PROMPT"
PROMPT+=" \$(vi_mode_prompt_info) $reset"
RPROMPT=''

#.zshrc
#Andrew Shimabuku
#05-25-12

alias ls='ls --color=auto'

export PAGER=most

#Git info in your ZSH Prompt (http://briancarper.net/blog/570/git-info-in-your-zsh-prompt)

autoload -Uz vcs_info

zstyle ':vcs_info:*' stagedstr '%F{green}●'
zstyle ':vcs_info:*' unstagedstr '%F{yellow}●'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{11}%r'
zstyle ':vcs_info:*' enable git svn
precmd () {
    if [[ -z $(git ls-files --other --exclude-standard 2> /dev/null) ]] {
        zstyle ':vcs_info:*' formats '][%F{green}%b%c%u%F{blue}'
    } else {
        zstyle ':vcs_info:*' formats '][%F{green}%b%c%u%F{red}●%F{blue}'
    }

    vcs_info
}

setopt prompt_subst

#Original prompt
#PROMPT='%F{white}%n@%m %c${vcs_info_msg_0_}%F{blue} %(?/%F{blue}/%F{red})%% %{$reset_color%}'

#Modified prompt
PROMPT='[%F{green}%B%n%F{white}%b:%~${vcs_info_msg_0_}%F{blue}%(?/%F{blue}/%F{red})% %F{white}]%# %{$reset_color%}'

#Date insert into prompt: [%F{green}%B%T%b]

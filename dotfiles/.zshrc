PROMPT='%(?.%F{green}√.%F{red}?%?)%f %B%F{240}%1~%f%b %# '                      
                                                                                
autoload -Uz vcs_info                                                           
precmd_vcs_info() { vcs_info }                                                  
precmd_functions+=( precmd_vcs_info )                                           
setopt prompt_subst                                                             

export PATH="/usr/local/sbin:$PATH"
HISTFILE=1

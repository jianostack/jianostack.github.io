export PATH="$HOME/.composer/vendor/bin/:/Users/username/Library/Python/3.4/bin:/Library/Frameworks/Python.framework/Versions/3.4/bin:/usr/local/mysql/bin:/usr/local/go/bin:$PATH"
export PS1="\u@\w$ "

#Uncomment to switch php versions
# export PATH=/usr/local/php5/bin:$PATH

alias mysqlstart=' sudo /usr/local/mysql/support-files/mysql.server start'
alias mysqlstop=' sudo /usr/local/mysql/support-files/mysql.server stop'
alias mysqlrestart=' sudo /usr/local/mysql/support-files/mysql.server restart'
alias l='ls'

# MacPorts Installer addition on 2016-07-19_at_09:19:30: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.
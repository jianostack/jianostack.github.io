## Install XDebug

Follow the steps over felixfbecker has provided. The wizard is very helpful.

https://github.com/felixfbecker/vscode-php-debug


At the end of your php.ini include:

```
[XDebug]
zend_extension="/usr/local/lib/php/pecl/20170718/xdebug.so"
xdebug.remote_enable=1
xdebug.var_display_max_depth= -1 
xdebug.var_display_max_children= -1
xdebug.var_display_max_data= -1 
xdebug.remote_log="/tmp/xdebug.log"
xdebug.remote_host=superlt-www.test
xdebug.remote_port=9001
#xdebug.remote_handler=dbgp
#xdebug.remote_autostart=1
#xdebug.remote_connect_back=1
```

Now install the VScode php-debug extension.

## Debuggin'

Start the extension. (F5)

XDebug will look for your localhost. Custom domains don't work for default.

Set your breakpoint and then refresh your endpoint.

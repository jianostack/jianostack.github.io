## AWS CLI
`brew install awscli`

# Cellar on mac
`/usr/local/Cellar`

# Redis
`brew install redis`

`brew services start redis`

`redis-cli`

# Install the latest PHP
`xcode-select --install`

`brew install openldap libiconv`

`brew install php`

`php -v`

# Switch PHP versions
`brew unlink php`

`brew install php@5.6`

`brew link php@5.6 -f`

If you get segmentation fault then comment or remove:

`/usr/local/etc/php/5.6/conf.d/ext-opcache.ini`

# MySQL

Unlinking and linking mysql symlinks cannot be done.

The old version must be `brew uninstall` and new version installed.

Databases will be lost!

```
brew uninstall mysql
rm -rf /opt/homebrew/var/mysql
ps aux | grep mysql
kill process numbers
brew install mysql
```

## Cellar on mac
/usr/local/Cellar

## Redis
`brew install redis`
`brew services start redis`
`redis-cli`

## Install the latest PHP

`xcode-select --install`
`brew install openldap libiconv`
`brew install php`
`php -v`

## Switch PHP versions

`brew unlink php`
`brew install php@5.6`
`brew link php@5.6 -f`

If you get segmentation fault then comment or remove:

`/usr/local/etc/php/5.6/conf.d/ext-opcache.ini`

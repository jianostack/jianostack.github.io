// check apache user
// echo exec('whoami');

$output=shell_exec('/usr/bin/git pull');
echo "<pre>$output</pre>";
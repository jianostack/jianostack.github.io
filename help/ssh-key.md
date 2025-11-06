# SSH Keys


## Generate

Public and Private key gen
```
ssh-keygen -t ed25519 -C "your_email@example.com"
```

Fish
```
eval (ssh-agent -c)
```

Zsh
```
eval "$(ssh-agent -s)"
```

Config
```
vim ~/.ssh/config

Include ~/.orbstack/ssh/config

Host github.com *.github.com
  AddKeysToAgent yes
  UseKeychain yes
  PreferredAuthentications publickey
  IdentityFile ~/.ssh/name_of_private_key

host i-* mi-*
  IdentityFile ~/.ssh/name_of_private_key
  ProxyCommand ~/.ssh/aws-ssm-ec2-proxy-command.sh %h %r %p ~/another_dir/public_key.pub
  StrictHostKeyChecking no

```



## Too many authentication failures
You have too many key stored in your local ssh-agent.
```
ssh-add -l
ssh-add -D
```


## Resources
https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

https://stackoverflow.com/questions/31051504/unable-to-connect-from-ec2-server/31058436#31058436

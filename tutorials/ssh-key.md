# Generate ssh key

https://help.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

Generate ssh key
`ssh-keygen -t rsa -b 4096 -C "your_email@example.com"`

Start the ssh-agent in the background
`eval "$(ssh-agent -s)"`

MacOS
`~/.ssh/config`

```
Host *
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_rsa
```

`ssh-add -K ~/.ssh/id_rsa`

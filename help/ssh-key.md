## Generate ssh key
https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

`ssh-keygen -t ed25519 -C "your_email@example.com"`

`eval "$(ssh-agent -s)"`

## Too many authentication failures
You have too many key stored in your local ssh-agent.
```
ssh-add -l
ssh-add -D
```

https://stackoverflow.com/questions/31051504/unable-to-connect-from-ec2-server/31058436#31058436

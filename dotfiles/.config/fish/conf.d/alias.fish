alias cloud9-uat="aws ssm start-session --target i-080838df7de48ff09"

alias ecr-login-uat='aws ecr get-login-password --region ap-southeast-1 | docker login --username AWS --password-stdin 725613346917.dkr.ecr.ap-southeast-1.amazonaws.com'

alias ecr-login-prd='aws ecr get-login-password --region ap-southeast-1 | docker login --username AWS --password-stdin 054266041727.dkr.ecr.ap-southeast-1.amazonaws.com'

alias ecr-repouri-ls="aws ecr describe-repositories --query 'repositories[].repositoryUri' --output table"

alias cloud9-prd="aws ssm start-session --target i-0d25772838b985d59"

alias jianostack="cd ~/Sites/jianostack.github.io && nvim ."

alias vim="nvim"

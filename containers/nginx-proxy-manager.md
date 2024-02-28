# Nginx proxy manager

NPM exposes services easily. It also supports Let's encrypt.
https://nginxproxymanager.com/guide/#quick-setup

Add the network config to the docker-compose.yml
```
networks:
  default:
    name: proxiable
    external: true
```

Create the docker network
`docker network create proxiable`

## Harden NPM
1. Settings > Default Site > change to 404 page
2. Delete port 81 from EC2 security group when not in use

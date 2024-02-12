# Docker

As Hykes described it in his PyCon talk, containers are “self-contained units of software you can deliver from a server over there to a server over there, from your laptop to EC2 to a bare-metal giant server, and it will run in the same way because it is isolated at the process level and has its own file system.”

## prune images
`docker image prune -a`

## build
`docker build -t image_name:image_tag_optional path_to_dockerfile`

## run
`docker run --env-file .env --env DB_HOST=host.docker.internal -p host_port:container_port image_name`

## list active containers
`docker ps`

## stats
`docker stats`

## remove all stopped containers
`docker rm $(docker ps -a -q)`

## run commands
`docker exec -it <container_id> bash`

## logs
`docker logs <container_id> | head`

## stats
`docker stats <container_id_1>`

## docker kill all
`docker kill $(docker ps -q)`

### remove images
`docker rmi image_id`

## copy file
`docker cp mycontainer_id:/foo.txt foo.txt`

## volume

`docker volume create volumename`

`docker run -p 8080:80 --env-file .env -v volumename:/var/www/html buildname`

## use local DB
`DB_HOST=host.docker.internal`

## save image to tar
`docker save -o <path for generated tar file> <image name>`

## load tar image
`docker load -i <path to image tar file>`

## remove all images
`docker rmi $(docker images -a)`

## Dockerfile RUN
The RUN instruction will execute any commands in a new layer on top of the current image and commit the results. The resulting committed image will be used for the next step in the Dockerfile.

## Dockerfile CMD
There can only be one CMD instruction in a Dockerfile.
The main purpose of a CMD is to provide defaults for an executing container (ENTRYPOINT).

## Dockerfile ENTRYPOINT
An ENTRYPOINT allows you to configure a container that will run as an executable. It will insert custom arguements into CMD.

## AWS CLI and ECR
`aws ecr get-login-password --region region | docker login --username AWS --password-stdin aws_account_id.dkr.ecr.region.amazonaws.com`

## Build args
```
export HTTP_PROXY=http://10.20.30.2:1234
docker build --build-arg HTTP_PROXY .
```

## AWS Public ECR 403
```
docker logout public.ecr.aws
```

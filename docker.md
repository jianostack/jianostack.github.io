### build
`docker build -t image_name:image_tag_optional path_to_dockerfile`

### run
`docker run --env-file .env -p host_port:container_port image_name:image_tag_optional`

### list images
`docker ps`

### stats
`docker stats`

### remove all stopped containers
`docker rm $(docker ps -a -q)`

### run commands
docker exec -it <container_id> ash

docker exec -it <container_id> bash

### logs
docker logs <container_id> | head

### stats
docker stats <container_id_1>

### docker kill all
`docker kill $(docker ps -q)`

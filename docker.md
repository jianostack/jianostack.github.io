### build
`docker build -t image_name:image_tag_optional path_to_dockerfile`

### run
`docker run --env-file .env -p host_port:container_port image_name:image_tag_optional`

`docker run --env DB_HOST=host.docker.internal --env DB_PORT=3306 -p 5000:80 koi-api`

### list active containers
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

### remove images
docker rmi image_id

### copy file
docker cp mycontainer_id:/foo.txt foo.txt

### volume

`docker volume create volumename`

`docker run -p 8080:80 --env-file .env -v volumename:/var/www/html buildname`

### use local DB
`DB_HOST=host.docker.internal`

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

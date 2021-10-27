docker-create () {
  docker-machine create --driver virtualbox $1
  eval $(docker-machine env $1)
  docker ps -a
}

docker-start () {
  docker-machine start $1
  eval $(docker-machine env $1)
  docker ps -a
}

docker-status () {
  docker-machine ls
  docker images
  docker ps -a
}

docker-clear () {
  docker stop $(docker ps -a -q)
  docker rm $(docker ps -a -q)
  docker rmi $(docker images -q)
  docker ps -a
  docker images
}

docker-remove () {
  docker stop $(docker ps -a -q)
  docker rm $(docker ps -a -q)
  docker ps -acd
}

docker-open () {
  docker exec -it $1 bash
}

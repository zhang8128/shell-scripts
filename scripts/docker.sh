docker-start () {
  docker start $1
  docker ps -a
}

docker-status () {
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
  docker ps -a
}

docker-open () {
  docker exec -it $1 bash
}

#!/bin/bash



echo "Do you want to make a private docker registry? "
echo "<yes> or <no>"
read aaa

if [[ "$aaa" == "yes" ]]; then
  docker run -d -p 5000:5000 --name registry registry:2
  curl -X GET http://localhost:5000/v2/_catalog
  docker ps -a | grep -i registry:2
fi


HERE=`pwd`
echo "============================"
echo "build container"
echo "============================"
DOCKER_REGISTRY_IP="127.0.0.1"
docker images | grep python3
docker build --no-cache -t          127.0.0.1:5000/python3 .

# TAG due to moving from multinode cluster to single node silicon
# ... and for having multiple examples run locally.
edocker tag 127.0.0.1:5000/python3  localhost:5000/phyon3:latest
edocker tag 127.0.0.1:5000/python3  127.0.0.1:5000/ubuntu:latest
edocker tag 127.0.0.1:5000/python3  localhost:5000/ubuntu:latest
edocker tag 127.0.0.1:5000/python3  127.0.0.1:5000/php-redis:latest
edocker tag 127.0.0.1:5000/python3  localhost:5000/php-redis:latest

docker images | grep 127.0.0.1
docker images | grep localhost

echo "==============================="
echo "verify registry exists"
echo "==============================="
export NO_PROXY=localhost,127.0.0.1
export no_proxy=localhost,127.0.0.1

docker ps -a | grep registry:2
wget       -qO- http://127.0.0.1:5000/v2/_catalog

docker images | grep python3
echo "==============================="
echo " push new image to private registry"
echo "==============================="
docker push 127.0.0.1:5000/python3:latest 

echo "==============================="
echo " verify new image is in private registry"
echo "==============================="
wget       -qO- http://127.0.0.1:5000/v2/_catalog

echo "==============================="
echo " pull new image from private registry"
echo "==============================="
docker pull         127.0.0.1:5000/python3 

echo "==============================="
echo " run new image and test it"
echo "==============================="
docker run -it --rm 127.0.0.1:5000/python3 ls -la
docker run -it --rm 127.0.0.1:5000/python3 cloc /etc

docker images | grep python3

echo "DONE"


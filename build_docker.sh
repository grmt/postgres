docker build . --build-arg PLATFORM=linux/amd64 --build-arg VERSION=14.4 -t key2asset/postgres 2>&1 | tee build_docker.log
docker tag key2asset/postgres key2asset/postgres:develop-latest
docker push key2asset/postgres:develop-latest

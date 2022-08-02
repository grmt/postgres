docker build . --build-arg PLATFORM=linux/amd64 --build-arg VERSION=14.2 -t key2asset/postgres
docker tag key2asset/postgres key2asset/postgres:develop-latest
docker push key2asset/postgres:develop-latest

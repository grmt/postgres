TAG=$(git log -1 --pretty=format:%h)
docker build . --build-arg PLATFORM=linux/amd64 --build-arg VERSION=14.5 -t key2asset/postgres:${TAG} 2>&1 | tee build_docker.log || (echo  "build failed" && exit 1)
docker tag key2asset/postgres:{TAG} key2asset/postgres:develop-latest
docker push key2asset/postgres:{TAG}
# docker run -e POSTGRES_PASSWORD=postgres key2asset/postgres:develop-latest

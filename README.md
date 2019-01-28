# Jenkins with Docker

Repository showing how to setup Jenkins run on Docker.

1. Build DockerFile

```
docker image build -t oskardudycz/jenkins .
```

2. Login to you docker account

```
docker login
```

3. Push image to Docker Hub

```
docker image push oskardudycz/jenkins
```

4. Set secrets

```
printf "admin" | docker secret create jenkins-pass -
printf "admin" | docker secret create jenkins-user -
```

5. Start Jenkins (in Docker Swarm)

```
docker stack deploy -c jenkins.yml jenkins
```

6. Open [Jenkins in browser](http://localhost:8080/). Login with username and password passed in secrets (eg. `admin`, `admin`).

7. Stop Jenkins

```
docker stack rm jenkins
```

8. Remove secrets

```
docker secret rm jenkins-user

docker secret rm jenkins-pass
```

## Important links

- [Viktor Farcic - Automating Jenkins Docker Setup](https://technologyconversations.com/2017/06/16/automating-jenkins-docker-setup/)
- [Managing Docker Secrets](https://docs.docker.com/engine/swarm/secrets/)

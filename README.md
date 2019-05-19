# Jenkins with Docker

Repository showing how to setup Jenkins run on Docker.

## 1. Build DockerFile

```
docker image build -t oskardudycz/jenkins .
```

## 2. Login to you docker account

```
docker login
```

## 3. Push image to Docker Hub

```
docker image push oskardudycz/jenkins
```

## 4. Set secrets

```
printf "admin" | docker secret create jenkins-pass -
printf "admin" | docker secret create jenkins-user -
```

## 5. Start Jenkins (in Docker Swarm)

```
docker stack deploy -c jenkins.yml jenkins
```

## 6. Open [Jenkins in browser](http://localhost:8080/). Login with username and password passed in secrets (eg. `admin`, `admin`).

## 7. Create job definition.

## 8. Copy job definition with:

```
curl -s http://admin:admin@localhost:8080/job/Backend/config.xml --header "Content-Type: application/xml" | "backend-config.xml"
```

## 9. Stop Jenkins

```
docker stack rm jenkins
```

## 10. Remove secrets

```
docker secret rm jenkins-user

docker secret rm jenkins-pass
```

## Important links

- [Viktor Farcic - Automating Jenkins Docker Setup](https://technologyconversations.com/2017/06/16/automating-jenkins-docker-setup/)
- [Managing Docker Secrets](https://docs.docker.com/engine/swarm/secrets/)
- [Miro Juuso - Building your first Docker image with Jenkins 2: Guide for developers](https://getintodevops.com/blog/building-your-first-docker-image-with-jenkins-2-guide-for-developers)
- [Ryan J. McDonough - Creating containerized build environments with the Jenkins Pipeline plugin and Docker. Well, almost.](https://damnhandy.com/2016/03/06/creating-containerized-build-environments-with-the-jenkins-pipeline-plugin-and-docker-well-almost/)
- [Maxfield Stewart/RiotGames - Revisiting Docker and Jenkins](https://engineering.riotgames.com/news/revisiting-docker-and-jenkins)

https://technologyconversations.com/2017/06/16/automating-jenkins-docker-setup/

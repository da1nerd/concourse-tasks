# concourse-tasks

These are some sample tasks and a pipeline for translationCore.

## Prerequisits

1. install [docker](https://docs.docker.com/install/linux/docker-ce/ubuntu/#set-up-the-repository)
1. install [docker-compose](https://docs.docker.com/compose/install/)
1. install concourse on either:
   1. [a server](https://github.com/concourse/concourse-docker)
   1. [your local machine](https://concourse-ci.org/) (see quick start guide)
1. install [fly](https://github.com/concourse/concourse/releases) on your local machine so you can interact with concourse.
1. deploy the pipeline with fly!

## NGINX Reverse Proxy

When running on a server you'll likely want to run concourse behind a domain. You can do this by setting up a reverse proxy in nginx.

```
upstream concourse {
	server localhost:8080;
}

server {
	listen 80:
	listen [::]:80;

	server_name [your.domain.name];

	location / {
		proxy_set_header Host $http_host;
		proxy_set_header X-Real-IP $remote_addr;
		proxy_set_header X-Forwarded-For proxy_add_x_forwarded_for;

		proxy_redirect off;
		proxy_pass http://concourse;
	}
}
```
You could also add ssl support in the above configuration if desired.

> Note: concourse will still be accessible from port `8080` directly. If this is undesirable you can set up a firewall on your server.

## Deployment

> These deployment instructions assume you are running concourse on your local machine.
> If you are running it on a server simply change the target url to the appropriate address and port.

First log into your concourse instance
```
fly -t ci.door43 login -n tc -c https://ci.door43.org
```
> TRICKY: if you are logging in to any team other than `main` you'll need to specify the team name
> with `-n` as shown above.

Then deploy the pipeline
```
fly -t ci.door43 set-pipeline -p translationCore -c tc-pipeline.yml -l credentials.yml
```

> NOTE: you'll need to provide the correct credentials inside `credentials.yml` see [Parameters](https://concoursetutorial.com/basics/parameters/) for details.

To debug a job
```
fly -t ci.door43 intercept -j map/build
```

To execute a single job without running the entire pipeline
```
fly -t ci.door43 execute --config tasks/unit-tests.yml
```

## Docker Image

This repo contains the Docker image used in jobs.
If you update the image you can deploy it again with the following commands:

```bash
docker build -t neutrinog/concourse-tasks .
docker push neutrinog/concourse-tasks:latest
```

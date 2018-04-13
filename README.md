# concourse-tasks

These are some sample tasks and a pipeline for translationCore.

## Usage

To get started follow the direction at https://concourse-ci.org/ and deploy the pipeline included in this repository.

However, here's a quick run down:

1. install docker
1. install docker-compose
1. install concourse
1. install fly (download link in your running concourse instance)
1. deploy the pipeline.

## Deployment

First log into your concourse instance
```
fly -t ci login -c http://127.0.0.1:8080
```

Then deploy the pipeline
```
fly -t ci set-pipeline -p map -c tc-pipeline.yml -l credentials.yml
```

To debug a job
```
fly -t ci intercept -j map/build
```

To execute a single job without running the entire pipeline
```
fly -t ci execute --config tasks/unit-tests.yml
```

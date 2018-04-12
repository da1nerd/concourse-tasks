# concourse-tasks

These are some sample tasks and a pipeline for translationCore.

To get started follow the direction at https://concourse-ci.org/ and deploy the pipeline included in this repository.

## Deployment

First log into your concourse instance
```
fly -t ci login -c http://127.0.0.1:8080
```

Then deploy the pipeline
```
fly -t ci set-pipeline -p translationCore -c tc-pipeline.yml
```

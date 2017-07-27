# ecs-bjs-amazonlinux
This is simplified amazonlinux docker image user guide for AWS BJS region



## ECR mirror for amazonlinux

the following Amazon ECR repo is a local mirror in BJS region with [cross-account image pulling](http://docs.aws.amazon.com/AmazonECR/latest/userguide/RepositoryPolicyExamples.html#IAM_allow_other_accounts) for [amazonlinux on docker hub](https://hub.docker.com/_/amazonlinux/). You may docker pull it directly within China to speed up the access.

###### 937788672844.dkr.ecr.cn-north-1.amazonaws.com.cn/amazonlinux:latest

Example: pull the *amazonlinux* mirror from ECR in *cn-north-1* by

```
docker pull 937788672844.dkr.ecr.cn-north-1.amazonaws.com.cn/amazonlinux:latest
```

Please note this is official amazonlinux docker image for global region and we need some tweaks to accelerate the *yum update* process with that.  Please follow the instructions below to generate the amazonlinux image optimized for BJS region(cn-north-1).

## Build your amazonlinux for BJS(cn-north-1)

fetch and evaluate the ECR credentials 

```
# $(aws --region=cn-north-1 ecr get-login --no-include-email)
Login Succeeded
(you just need to run this command once)
```

Docker build on top of the BJS ECR mirror of amazonlinux

```
$ docker build -t amazonlinux:latest-bjs .
```



## test your amazonlinux:latest-bjs image from BJS region

```
# docker run -ti amazonlinux:latest-bjs bash
bash-4.2# yum update -y
(this should trigger the update immediately with local yum repository in China)
```





## TODO

1. create a CodeBuild project to periodically pull and push official amazonlinux image from Docker Hub to BJS ECR
2. CloudWatch Events to trigger the automation
3. create a CloudFormation stack for BJS to provision a basic ECS environment
# ecs-bjs-amazonlinux
This is amazonlinux docker image use guide for AWS BJS region



## ECR mirror for amazonlinux

###### 937788672844.dkr.ecr.cn-north-1.amazonaws.com.cn/amazonlinux:latest

pull the amazonlinux mirror from ECR in cn-north-1 by

```
docker pull 937788672844.dkr.ecr.cn-north-1.amazonaws.com.cn/amazonlinux:latest
```

Please note this is official amazonlinux docker image for global region. Please follow the instructions below to generate the amazonlinux image for BJS(cn-north-1)

## Build your amazonlinux for BJS(cn-north-1)

```
# $(aws --region=cn-north-1 ecr get-login --no-include-email)
Login Succeeded
$ docker build -t amazonlinux:latest-bjs .
```



## test your amazonlinux:latest-bjs image from BJS region

```
# docker run -ti amazonlinux:latest-bjs bash
bash-4.2# yum update -y
(this should trigger the update immediately with local yum repository in China)
```


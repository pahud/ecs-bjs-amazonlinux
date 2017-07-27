FROM 937788672844.dkr.ecr.cn-north-1.amazonaws.com.cn/amazonlinux:latest

env AWS_REGION cn-north-1
env awsregion cn-north-1
env awsdomain amazonaws.com.cn

RUN echo $awsdomain > /etc/yum/vars/awsdomain && \
echo $awsregion > /etc/yum/vars/awsregion

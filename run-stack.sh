#!/bin/bash

aws cloudformation $ACTION \
    --region us-east-2 \
    --stack-name $STACK_NAME \
    --template-body file://service.yaml \
    --capabilities CAPABILITY_NAMED_IAM \
    --parameters \
    ParameterKey=DockerImage,ParameterValue=321442529690.dkr.ecr.us-west-2.amazonaws.com/example-webapp:cbaa3fd222947a73907f5f9295f53cf03524557e/example-webapp:$(git rev-parse HEAD) \
    ParameterKey=VPC,ParameterValue=vpc-0e09bd68
    ParameterKey=Cluster,ParameterValue=default \
    ParameterKey=Listener,ParameterValue=arn:aws:elasticloadbalancing:us-west-2:321442529690:listener/app/production-website/e048c5419a47983d/4232d6bdb9168aa0

k3s-Kubernetes
Initial Conditions:

1.Tested on Mac M3 Apple Silicon
2.Docker Desktop for Mac Silicon downloaded and installed
3.Kubernetes enabled in setup
4.Docker Desktop up and running
5.wget and curl are installed
6. bash files have the necessary file permissions chmod ugo + x {filename}


Step1: Code download using HTTPS Paste into Browser the following:

	 https://github.com/keepdevops/=repositories

Step2: k3s-Kubernetes  then CODE download repository based on your credentials.
       


Step2: Create Docker private registry "yes or no" with the bash file below:

	./Docker.build.first.bash


Step3: Create docker image 127.0.0.1:5000/python3:latest and performs verification  that docker image is in docker private registry


Step4: Choose deployment you want to run

run_replicaset_autoscale 

	./_lesson-1-replica-set.bash


This Deployment demonstrates ReplicaSet keeping the Desired State set in yaml file of 5 pods even when running pods update Label.

 run_deployment_autoscale

	./_lesson-2-deployment-autoscale.bash

This Deployment uses stress-ng test to create stress on Pods.

 


    

  

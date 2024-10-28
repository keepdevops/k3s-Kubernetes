ks-Kubernetes
Initial Conditions:

1.Tested on Mac M3 Apple Silicon
2.Docker Desktop for Mac Silicon downloaded and installed
3.Kubernetes enabled in setup
4.Docker Desktop up and running
5.wget and curl are installed
6. bash files have the necessary file permissions chmod ugo + x {filename}


Step1: Code download using HTTPS Paste into Browser the following:

	 https://github.com/keepdevops/=repositories

Step2: k3s-Kubernetes  then code download repository based on your credentials.
       
	HTTPS or SSH or Github Cli or zip.


Step3: cd _build_container/ return then ls and then ./Docker.build.first.bash



Step4: Docker.build.first.bash will ask if you want to create a registry "yes or no"

Step5: It will then build the Dockerfile 


 Bash script creates docker image 127.0.0.1:5000/python3:latest and performs verification  that docker image is in docker private registry


Step6: Choose deployment you want to run

run_replicaset_autoscale 

	./_lesson-1-replica-set.bash


This Deployment demonstrates ReplicaSet keeping the Desired State set in yaml file of 5 pods even when running pods update Label.

 run_deployment_autoscale

	./_lesson-2-deployment-autoscale.bash

This Deployment uses stress-ng test to create stress on Pods.

 
#EOF

    

  

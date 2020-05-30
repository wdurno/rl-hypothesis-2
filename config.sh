export RL_HYPOTHESIS_2_DOCKER_IMAGE_VERSION=0.0.19
export RL_HYPOTHESIS_2_DOCKER_REGISTRY_HEAD=gcr.io/gdax-dnn/
export RL_HYPOTHESIS_2_DOCKER_BUILDER_IMAGE=${RL_HYPOTHESIS_2_DOCKER_REGISTRY_HEAD}rl-hypothesis-2:builder-${RL_HYPOTHESIS_2_DOCKER_IMAGE_VERSION}
export RL_HYPOTHESIS_2_DOCKER_CONTROLLER_IMAGE=${RL_HYPOTHESIS_2_DOCKER_REGISTRY_HEAD}rl-hypothesis-2:controller-${RL_HYPOTHESIS_2_DOCKER_IMAGE_VERSION}
export RL_HYPOTHESIS_2_GKE_VERSION=1.14.10-gke.36
export RL_HYPOTHESIS_2_CUDNN_6_PATH=/home/wdurno/cudnn-8.0-linux-x64-v6.0.tgz
export RL_HYPOTHESIS_2_SERVICE_ACCOUNT_JSON_PATH=../service-account.json
export RL_HYPOTHESIS_2_SERVICE_ACCOUNT_NAME=project-admin@gdax-dnn.iam.gserviceaccount.com
export RL_HYPOTHESIS_2_NETOWRK=projects/gdax-dnn/global/networks/default
export RL_HYPOTHESIS_2_SUBNETWORK=projects/gdax-dnn/regions/us-central1/subnetworks/default
export RL_HYPOTHESIS_2_PROJECT=gdax-dnn
export RL_HYPOTHESIS_2_ZONE=us-central1-a
export RL_HYPOTHESIS_2_GIT_REPO=git@github.com:wdurno/rl-hypothesis-2.git
export RL_HYPOTHESIS_2_REPO_DIR_NAME=rl-hypothesis-2
export RL_HYPOTHESIS_2_GIT_USER_NAME=wdurno
export RL_HYPOTHESIS_2_GIT_USER_EMAIL=wdurno@gmail.com

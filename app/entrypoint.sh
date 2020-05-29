_JOB=$1
# Override JOB if arg given 
if [ -z "$_JOB" ]; then echo "JOB=$JOB"; else export JOB=$_JOB; fi

source config.sh 
gcloud auth activate-service-account $RL_HYPOTHESIS_2_SERVICE_ACCOUNT_NAME --key-file service-account.json || exit 1 
cat service-account.json | docker login -u _json_key --password-stdin https://gcr.io/gdax-dnn || exit 1
gcloud container clusters get-credentials rlh2-$RL_HYPOTHESIS_2_JOB_ID --zone $RL_HYPOTHESIS_2_ZONE --project $RL_HYPOTHESIS_2_PROJECT || exit 1
git clone $RL_HYPOTHESIS_2_GIT_REPO || exit 1

if [ $JOB == "0-in" ]; then
	echo "Interactive mode..."
fi

if [ $JOB == "5-bu" ]; then
	echo Attempting controller image build...
	cd /app/${RL_HYPOTHESIS_2_REPO_DIR_NAME}/docker/controller
	source docker-build.sh 
fi

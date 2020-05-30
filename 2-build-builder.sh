
echo "configuring environment variables..."

echo "===="
cat config.sh 
echo "===="
source config.sh  
echo "===="
env | grep RL_HYPOTHESIS_2  
echo "===="

echo "building builder image..."

echo "===="
cp config.sh docker/controller/app/config.sh 
cp $RL_HYPOTHESIS_2_SERVICE_ACCOUNT_JSON_PATH docker/builder/app/service-account.json
cp $RL_HYPOTHESIS_2_SERVICE_ACCOUNT_JSON_PATH docker/controller/app/service-account.json 
mkdir -p docker/builder/app/.ssh
cp ~/.ssh/* docker/builder/app/.ssh
cd docker/builder
cat docker-build.sh 
echo "===="
bash docker-build.sh 
echo "===="
cd ../..
rm docker/builder/app/service-account.json
rm docker/controller/app/service-account.json 
rm docker/controller/app/config.sh 
rm docker/builder/app/.ssh/*


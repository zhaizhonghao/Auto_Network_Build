export PATH=${PWD}/bin:$PATH
echo "=================org1 enrollment================="
cd org1
./1_enrollOrg1AdminAndUsers.sh
./2_generateMSPOrg1.sh 

echo "=================org2 enrollment=================" 
cd ../org2
./1_enrollOrg2AdminAndUsers.sh
./2_generateMSPOrg2.sh 
 
echo "=================orderer enrollment================="
cd ../orderer
./1_enrollAdminAndMSP.sh
./2_artifact.sh
sleep 5

echo "=================org1 create and join the channel=================" 
cd ../org1
./3_createChannel.sh

echo "=================org2 join the channel=================" 
cd ../org2
./3_joinChannel.sh

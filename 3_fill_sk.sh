#!/bin/sh
#============ for org2 user1 =========== 
Folder_org1_user1="./org1/crypto-config-ca/peerOrganizations/org1.example.com/users/User1@org1.example.com/msp/keystore"
file_org1_user1=""
for file_a in ${Folder_org1_user1}/*
    do
        file_org1_user1=`basename $file_a`
    break
done
echo $file_org1_user1

sed -i "s/path: ..\/org1\/crypto-config-ca\/peerOrganizations\/org1.example.com\/users\/User1@org1.example.com\/msp\/keystore\/.*_sk/path: ..\/org1\/crypto-config-ca\/peerOrganizations\/org1.example.com\/users\/User1@org1.example.com\/msp\/keystore\/$file_org1_user1/g" ./benchmarking/networks/fabric/v2.1/network-config_2.1.yaml

#============ for org1 Admin =========== 
Folder_org1_Admin="./org1/crypto-config-ca/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/keystore"
file_org1_admin=""
for file_a in ${Folder_org1_Admin}/*
    do
        file_org1_admin=`basename $file_a`
    break
done
echo $file_org1_admin

sed -i "s/path: ..\/org1\/crypto-config-ca\/peerOrganizations\/org1.example.com\/users\/Admin@org1.example.com\/msp\/keystore\/.*_sk/path: ..\/org1\/crypto-config-ca\/peerOrganizations\/org1.example.com\/users\/Admin@org1.example.com\/msp\/keystore\/$file_org1_admin/g" ./benchmarking/networks/fabric/v2.1/network-config_2.1.yaml


#============ for org2 Admin =========== 
Folder_org2_Admin="./org2/crypto-config-ca/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/keystore"
file_org2_admin=""
for file_a in ${Folder_org2_Admin}/*
    do
        file_org2_admin=`basename $file_a`
    break
done
echo $file_org2_admin

sed -i "s/path: ..\/org2\/crypto-config-ca\/peerOrganizations\/org2.example.com\/users\/Admin@org2.example.com\/msp\/keystore\/.*_sk/path: ..\/org2\/crypto-config-ca\/peerOrganizations\/org2.example.com\/users\/Admin@org2.example.com\/msp\/keystore\/$file_org2_admin/g" ./benchmarking/networks/fabric/v2.1/network-config_2.1.yaml

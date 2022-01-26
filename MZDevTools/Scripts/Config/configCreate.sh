#!/bin/sh

#  runScript.sh
#  MZDevTools
#
#  Created by Mehmet Zeytin on 25.01.2022.
#  

APP_NAME=$1
LOGENABLE=$2
INIT=$3
INIT_ENV=$4
INIT_LOG=$5


mkdir -p -- "${APP_NAME}"
class > ${APP_NAME}/Constanst.swift
mkdir -p ${APP_NAME}/Assets.xcassets
mkdir -p ${APP_NAME}/ProvisioningProfilesAndCertificates
mkdir -p ${APP_NAME}/ProvisioningProfilesAndCertificates/"Provisioning Profiles"
mkdir -p ${APP_NAME}/ProvisioningProfilesAndCertificates/"Push Notification Certificates"








 

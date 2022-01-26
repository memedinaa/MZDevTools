#!/bin/sh

#  initEnv.sh
#  MZDevTools
#
#  Created by Mehmet Zeytin on 25.01.2022.
#  

APP_NAME=$1
ENVIRONMENT=$2
SUFFIX=""
LOGENABLE=$3
BUNDLE_PREFIX=$4
PROJECT_NAME=$5

TIRNAK='"'
BOSLUK="\n"


if [ $ENVIRONMENT == "QA" ]
then
   SUFFIX=${ENVIRONMENT}InHouse
   elif [ $ENVIRONMENT == "UAT" ]
then
   SUFFIX=InHouse
elif [ $ENVIRONMENT == "RELEASE" ]
then
  SUFFIX=""
else
  SUFFIX=""
fi



BUNDLE_IDENTIFIER="${BUNDLE_PREFIX}.${APP_NAME}${SUFFIX}"
BUNDLE_IDENTIFIER_WIDGET="${BUNDLE_PREFIX}.${APP_NAME}${SUFFIX}.${APP_NAME}Widget"
BUNDLE_IDENTIFIER_ServiceExtensions="${BUNDLE_PREFIX}.${APP_NAME}${SUFFIX}.${APP_NAME}ServiceExtensions"

printf "#include ${TIRNAK}${PROJECT_NAME}/Configuration/projects/project.xcconfig${TIRNAK}\n"
printf "#include ${TIRNAK}${PROJECT_NAME}/Projects/${APP_NAME}/${APP_NAME}.xcconfig${TIRNAK}\n"

printf ${BOSLUK}
printf ${BOSLUK}
printf ${BOSLUK}
printf "//BUNDLE IDENTIFIER ${BOSLUK}"
printf "BUNDLE_ID=${BUNDLE_IDENTIFIER}\n"
printf ${BOSLUK}
printf "//ORTAM ${BOSLUK}"
printf "ENVIRONMENT=${ENVIRONMENT}\n"
printf ${BOSLUK}

printf "//APP GROUP DENTIFIER ${BOSLUK}"
printf "GROUP_IDENTIFIER=group.${BUNDLE_PREFIX}.${APP_NAME}${SUFFIX}\n"
printf ${BOSLUK}


#Deep link
printf "//DEEP LINK- URL SCHEMES ${BOSLUK}"
printf "URL_SCHEMES=${APP_NAME}\n"
printf ${BOSLUK}


#Script path okumak için //--file directory
printf "//Script path okumak için //--file directory ${BOSLUK}"
printf "PROJECT_FOLDER_NAME=${APP_NAME}\n"

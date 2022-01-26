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

STR='"'
SPACE="\n"


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

printf "#include ${STR}${PROJECT_NAME}/Configuration/projects/project.xcconfig${STR}\n"
printf "#include ${STR}${PROJECT_NAME}/Projects/${APP_NAME}/${APP_NAME}.xcconfig${STR}\n"
printf ${SPACE}
printf ${SPACE}
printf ${SPACE}
printf "//BUNDLE IDENTIFIER ${SPACE}"
printf "BUNDLE_ID=${BUNDLE_IDENTIFIER}\n"
printf ${SPACE}
printf "//ORTAM ${SPACE}"
printf "ENVIRONMENT=${ENVIRONMENT}\n"
printf ${SPACE}
printf "//APP GROUP DENTIFIER ${SPACE}"
printf "GROUP_IDENTIFIER=group.${BUNDLE_PREFIX}.${APP_NAME}${SUFFIX}\n"
printf ${SPACE}

#Deep link
printf "//DEEP LINK- URL SCHEMES ${SPACE}"
printf "URL_SCHEMES=${APP_NAME}\n"
printf ${SPACE}

#Script path okumak için //--file directory
printf "//Read for script path you can use run script  //--file directory ${SPACE}"
printf "PROJECT_FOLDER_NAME=${APP_NAME}\n"

#!/bin/sh

#  writeToFile.sh
#  MZDevTools
#
#  Created by Mehmet Zeytin on 25.01.2022.
#

APP_NAME=$1
SCRPT_PATH=$2
SCRPT_PATH_INIT=$3
BUNDLE_PREFIX=$4
PROJECT_NAME=$5

bash ${SCRPT_PATH_INIT} ${APP_NAME} > ${APP_NAME}/${APP_NAME}.xcconfig
bash ${SCRPT_PATH} ${APP_NAME} "QA" "" ${BUNDLE_PREFIX} ${PROJECT_NAME}  >  ${APP_NAME}/${APP_NAME}-"QA".xcconfig
bash ${SCRPT_PATH} ${APP_NAME} "UAT" "" ${BUNDLE_PREFIX} ${PROJECT_NAME}  >  ${APP_NAME}/${APP_NAME}-"UAT".xcconfig
bash ${SCRPT_PATH} ${APP_NAME} "RELEASE" "" ${BUNDLE_PREFIX} ${PROJECT_NAME}  >  ${APP_NAME}/${APP_NAME}-"RELEASE".xcconfig
open ${APP_NAME}

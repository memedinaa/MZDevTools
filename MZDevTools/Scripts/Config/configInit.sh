#!/bin/sh

#  init.sh
#  MZDevTools
#
#  Created by Mehmet Zeytin on 25.01.2022.
#  

APP_NAME=$1
printf "APP_VERSION=1.0\n"
printf "BUNDLE_VERSION=1\n"
printf "WIDGET_EXTENSION_NAME=${APP_NAME}Widget\n"
printf "NOTIFICATION_SERVICE_EXTENSION_NAME=${APP_NAME}ServiceExtensions"


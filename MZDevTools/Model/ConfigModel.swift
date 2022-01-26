//
//  ConfigModel.swift
//  MZDevTools
//
//  Created by Mehmet Zeytin on 25.01.2022.
//

import Foundation


struct ConfigModel{
    var appName:String = "{APP_NAME}"
    var environement:String = "{ENVIRONMENT}"
    var suffix:String = "{SUFFIX}"
    var logEnable:String?
    var bundlePrefix:String = "{bundlePrefix}"
    var projectName:String = "{projectName}"
}

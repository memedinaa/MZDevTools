//
//  Helper.swift
//  MZDevTools
//
//  Created by Mehmet Zeytin on 21.01.2022.
//

import Foundation
import Cocoa

class Helper {

    
    static func run(taskIsWait isWait:Bool = false , script:ScriptType , parameter:[String]? = [""], _ sender: NSButton){
        var stringPath = ""
        
        stringPath = Bundle.main.path(forResource: script.rawValue, ofType: "sh")!
        
        let path = "/bin/bash"
        
        let script = stringPath
        let arguments = [script]
        sender.isEnabled = !isWait
        let task = Process.launchedProcess(launchPath: path, arguments: arguments )
        
        let appDelegate = NSApp.delegate as! AppDelegate
        appDelegate.closePopover(sender: sender)
        if isWait{
            task.waitUntilExit()
            sender.isEnabled = true
        }
    }
    
    static func runWithArg(taskIsWait isWait:Bool = false , script:ScriptType , parameter:[String]? = [""], _ sender: NSButton){
        let arg = parameter ?? [""]
        let process            = Process()
        process.launchPath     = "/bin/bash"
        process.arguments      = [script.path()] + arg
        process.launch()
        
    }
    
    
    func createConfig(config:ConfigModel){
        Helper.runWithArg(script: .configCreate ,
                          parameter: [config.appName , "0", "","QA" ,""], NSButton())
        
        Helper.runWithArg(script: .configInit ,
                          parameter: [config.appName], NSButton())
        
        Helper.runWithArg(script: .configInitEnv ,
                          parameter: [config.appName , "QA" , "0" , config.bundlePrefix , config.projectName], NSButton())
        
       Helper.runWithArg(script: .writeToFile ,
                          parameter: [config.appName  , ScriptType.configInitEnv.path() , ScriptType.configInit.path() , config.bundlePrefix , config.appName], NSButton())
        
        Helper.runWithArg(script: .complete ,
                          parameter: [config.appName], NSButton())
        
        
        let appDelegate = NSApp.delegate as! AppDelegate
        appDelegate.closePopover(sender: nil)
    }
    
    func shell(_ args: String...) -> Int32 {
        let task = Process()
        task.launchPath = "/bin/bash open"
        task.arguments = args
        task.launch()
        task.waitUntilExit()
        return task.terminationStatus
    }
    
    func showNotification(_ message:String) -> Void {
        let notification = NSUserNotification()
        notification.informativeText = message
        notification.soundName = NSUserNotificationDefaultSoundName
        NSUserNotificationCenter.default.deliver(notification)
    }
}


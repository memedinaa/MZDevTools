//
//  Helper.swift
//  MZDevTools
//
//  Created by Mehmet Zeytin on 21.01.2022.
//

import Foundation
import Cocoa

class Helper {
    public enum ScriptType:String{
        case removeDerivedData
    }
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
    
    func showNotification(_ message:String) -> Void {
        let notification = NSUserNotification()
        notification.informativeText = message
        notification.soundName = NSUserNotificationDefaultSoundName
        NSUserNotificationCenter.default.deliver(notification)
    }
}


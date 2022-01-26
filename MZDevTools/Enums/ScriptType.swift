//
//  ScriptType.swift
//  MZDevTools
//
//  Created by Mehmet Zeytin on 25.01.2022.
//

import Foundation

 enum ScriptType:String{
    case removeDerivedData
    case configInit
    case configInitEnv
    case configCreate
    case writeToFile
    case complete
    
    func path() -> String{
        return Bundle.main.path(forResource: self.rawValue, ofType: "sh") ?? ""
    }
}

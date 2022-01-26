//
//  CreateConfigsViewController.swift
//  MZDevTools
//
//  Created by Mehmet Zeytin on 21.01.2022.
//

import Cocoa

class CreateConfigsViewController: NSViewController {

    @IBOutlet weak var txtTargetName: NSTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    @IBAction func tapCreateTarget(_ sender: Any) {
        let model =  ConfigModel(appName: txtTargetName.stringValue,
                                 environement: "QA",
                                 suffix: "suffixxxx",
                                 logEnable: "0",
                                 bundlePrefix: "com.memedinaaa",
                                 projectName: "TESTTT")
        
        
         Helper().createConfig(config: model)
    }
}

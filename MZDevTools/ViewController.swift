//
//  ViewController.swift
//  MZDevTools
//
//  Created by Mehmet Zeytin on 21.01.2022.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    @IBAction func removeDerivedData(_ sender: NSButton) {
        Helper.run(taskIsWait: true, script: .removeDerivedData, parameter: [], sender)
        Helper().showNotification(NSLocalizedString("Removed Derived Data", comment: ""))
    }

}

extension ViewController {
  // MARK: Storyboard instantiation
  static func freshController() -> ViewController {
      let storyboard = NSStoryboard(name: NSStoryboard.Name("Main"), bundle: nil)
      let identifier = NSStoryboard.SceneIdentifier.init("ViewController")
    guard let viewcontroller = storyboard.instantiateController(withIdentifier: identifier) as? ViewController else {
      fatalError("Why cant i find ViewController? - Check Main.storyboard")
    }
    return viewcontroller
  }
}

//
//  AppDelegate.swift
//  MZDevTools
//
//  Created by Mehmet Zeytin on 21.01.2022.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    let statusItem = NSStatusBar.system.statusItem(withLength:NSStatusItem.squareLength)
    let popover = NSPopover()
    var eventMonitor: EventMonitor?


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        if let button = statusItem.button {
          button.image = NSImage(named: "StatusBarButtonImage")
          button.action = #selector(AppDelegate.togglePopover(_:))
        }
        
        popover.contentViewController = ViewController.freshController()
        eventMonitor = EventMonitor(mask: [.leftMouseDown, .rightMouseDown]) { [weak self] event in
          if let strongSelf = self, strongSelf.popover.isShown {
            strongSelf.closePopover(sender: event)
          }
        }
 
        let em = NSAppleEventManager.shared()
        em.setEventHandler(self, andSelector: #selector(self.getUrl(_:withReplyEvent:)), forEventClass: AEEventClass(kInternetEventClass), andEventID: AEEventID(kAEGetURL))
        
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }
    
    
    @objc func togglePopover(_ sender: Any?) {
      if popover.isShown {
        closePopover(sender: sender)
      } else {
        showPopover(sender: sender)
      }
    }
    
    func showPopover(sender: Any?) {
      if let button = statusItem.button {
        popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
        eventMonitor?.start()
      }
    }
    
    func closePopover(sender: Any?) {
      popover.performClose(sender)
      eventMonitor?.stop()
    }
    
    @objc func getUrl(_ event: NSAppleEventDescriptor, withReplyEvent replyEvent: NSAppleEventDescriptor) {
        // Get the URL
        guard let urlStr: String = event.paramDescriptor(forKeyword: keyDirectObject)!.stringValue else {return}
        guard let components = URLComponents(url: URL(string: urlStr)!, resolvingAgainstBaseURL: false) else {return}
        
        if let queryItems = components.queryItems {
            for item in queryItems {
                if let message = item.value{
                    Helper().showNotification(message)
                }
            }
        }
        
    }
    
}


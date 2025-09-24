//
//  Untitled.swift
//  DynamicBattery
//
//  Created by Tau Leung on 24/09/2025.
//

import Cocoa
import SwiftUI

class AppDelegate: NSObject, NSApplicationDelegate {
    var statusItem: NSStatusItem!
    var batteryManager = BatteryManager()
    var timer: Timer?
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        print("appdelegate launched")
        // create a status in the menu bar
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        
        // display the init battery
        updateBatteryTitle()
        
        // timer for view updating
        timer = Timer.scheduledTimer(withTimeInterval: 30, repeats: true) { _ in
            self.updateBatteryTitle()
        }
        
        // add a menu for the app
        let menu = NSMenu()
        menu.addItem(NSMenuItem(title: "quit", action: #selector(quit), keyEquivalent: "q"))
        statusItem.menu = menu
    }
    
    private func updateBatteryTitle() {
        let battery = BatteryManager.getBatteryPercentage()
        if let button = statusItem.button {
            button.title = "🔋 \(battery)%"
        }
    }
    
    @objc func quit() {
        NSApplication.shared.terminate(nil)
    }
}

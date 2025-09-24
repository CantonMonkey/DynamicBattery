//
//  DynamicBatteryApp.swift
//  DynamicBattery
//
//  Created by Tau Leung on 24/09/2025.
//

import SwiftUI

@main
struct DynamicBatteryApp: App {
    // create AppDelegate，fir menu bar
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        Settings {
            EmptyView() // the view window is not needed
        }
    }
}



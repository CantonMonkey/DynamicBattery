//
//  ContentView.swift
//  DynamicBattery
//
//  Created by Tau Leung on 24/09/2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var batteryManager = BatteryManager()
    
    var body: some View {
        VStack {
            if batteryManager.batteryLevel >= 0 {
                Text("🔋 \(batteryManager.batteryLevel)%")
                    .font(.largeTitle)
                    .padding()
            } else {
                Text("cannot access battery ⚡️")
            }
        }
    }
}

#Preview {
    ContentView()
}






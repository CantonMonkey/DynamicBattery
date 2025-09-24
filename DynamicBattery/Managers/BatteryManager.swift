//
//  BatteryManager.swift
//  DynamicBattery
//
//  Created by Tau Leung on 24/09/2025.
//

import Foundation
import IOKit.ps

class BatteryManager: ObservableObject {
    @Published var batteryLevel: Int = -1
    private var timer: Timer?
    
    init() {
        updateBatteryLevel()
        // timer: update in every 30s
        timer = Timer.scheduledTimer(withTimeInterval: 30, repeats: true) { _ in
            self.updateBatteryLevel()
        }
    }
    
    private func updateBatteryLevel() {
        self.batteryLevel = Self.getBatteryPercentage()
    }
    
    static func getBatteryPercentage() -> Int {
        if let snapshot = IOPSCopyPowerSourcesInfo()?.takeRetainedValue(),
           let sources = IOPSCopyPowerSourcesList(snapshot)?.takeRetainedValue() as? [CFTypeRef],
           let source = sources.first,
           let description = IOPSGetPowerSourceDescription(snapshot, source)?.takeUnretainedValue() as? [String: Any],
           let capacity = description[kIOPSCurrentCapacityKey] as? Int,
           let max = description[kIOPSMaxCapacityKey] as? Int {
            return Int((Double(capacity) / Double(max)) * 100)
        }
        return -1
    }
}

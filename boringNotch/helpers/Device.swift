//
//  Device.swift
//  boringNotch
//
//  Created by Juan Garcia on 2/18/26.
//

import IOKit.ps

/// helps identify between battery or wall powered
func deviceHasBattery() -> Bool {
    guard let blob = IOPSCopyPowerSourcesInfo()?.takeRetainedValue(),
          let sources = IOPSCopyPowerSourcesList(blob)?.takeRetainedValue() as? [CFTypeRef] else {
        return false
    }
    
    /// array contains at least one source that is a battery
    for ps in sources {
        if let description = IOPSGetPowerSourceDescription(blob, ps)?.takeUnretainedValue() as? [String: Any],
           let type = description[kIOPSTransportTypeKey] as? String,
           type == kIOPSInternalType {
            return true
        }
    }
    
    return false
}

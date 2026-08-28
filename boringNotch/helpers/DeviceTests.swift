// DeviceTests.swift
// Test suite for Device.swift's deviceHasBattery function

import Testing

@Suite("Device battery detection")
struct DeviceTests {
    @Test("deviceHasBattery() prints result")
    func testDeviceHasBattery() async throws {
        let hasBattery = deviceHasBattery()
        print("deviceHasBattery() returned: \(hasBattery)")
        // No assertion here, as this is environment-dependent.
        // For demonstration, we only print the result.
    }
}

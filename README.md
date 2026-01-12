# CoreBluetoothMock_Dependencies (English Version)

`CoreBluetoothMock_Dependencies` is a Swift package that manages all the dependencies required by `CoreBluetoothMock.framework`.  
You can obtain `CoreBluetoothMock.framework` from [https://github.com/tochy0115/CoreBluetoothMock.git](https://github.com/tochy0115/CoreBluetoothMock.git).  
By adding this package through Swift Package Manager (SPM), CoreBluetoothMock can perform BLE communication on the iOS simulator via **BLE Sim Linker**, using macOS CoreBluetooth.

## Purpose

- Enable the use of `CoreBluetoothMock` on the iOS simulator.
- Manage multiple dependencies of `CoreBluetoothMock` in a single package, reducing manual setup.
- Provide a simple integration workflow using SPM.

## Supported Environments

- Xcode 26.2 or later (Swift / Objective-C)
- iOS Simulator (use CoreBluetooth on real devices)
- **BLE Sim Linker** must be running on macOS before launching the simulator.

## Installation

1. Obtain `CoreBluetoothMock.framework` from [https://github.com/tochy0115/CoreBluetoothMock.git](https://github.com/tochy0115/CoreBluetoothMock.git) and add it to **Frameworks, Libraries, and Embedded Content**.
2. In your app project, go to **File > Swift Packages > Add Package Dependency...**
3. Enter the following URL:

   ```
   https://github.com/tochy0115/CoreBluetoothMock_Dependencies.git
   ```

4. Choose the desired version (e.g., `from: "1.0.0"`)
5. Add the `CoreBluetoothMockDependencies` package.

## Usage

1. Add `CoreBluetoothMock.framework` to your project.
2. Link the added `CoreBluetoothMockDependencies` package.
3. Import CoreBluetoothMock in your code:

   ```swift
   #if targetEnvironment(simulator)
   import CoreBluetoothMock
   #else
   import CoreBluetooth
   #endif
   ```

   ```objective-c
   #if TARGET_OS_SIMULATOR
   #import <CoreBluetoothMock/CoreBluetoothMock.h>
   #else
   #import <CoreBluetooth/CoreBluetooth.h>
   #endif
   ```

4. Make sure **BLE Sim Linker** is running on macOS before starting the simulator.

This setup allows you to test Bluetooth functionality on the simulator using CoreBluetoothMock API.

## Notes

- Use CoreBluetooth.framework for testing Bluetooth functionality on real devices.
- The simulator mock does not fully replicate the behavior of real devices.
- CoreBluetoothMock API is designed to match CoreBluetooth as closely as possible, but some behaviors are simplified.
- If BLE Sim Linker is not running, the Bluetooth mock will not function correctly in the simulator.

## License

Apache License 2.0


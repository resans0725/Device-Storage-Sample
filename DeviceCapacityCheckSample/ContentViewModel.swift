//
//  ContentViewModel.swift
//  DeviceCapacityCheckSample
//
//  Created by 永井涼 on 2023/12/31.
//

import Foundation
final class ContentViewModel: ObservableObject {
    @Published var deviceCapacity = "Calculating..."
    @Published var showAlert = false
    
    func onAppear() {
        if let capacity = getDeviceCapacity() {
            deviceCapacity = "Free Space: \(capacity)"
            
            // Check if free space is less than 100MB
            if let freeSpaceInMB = capacity.convertToMegabytes(), freeSpaceInMB < 100 {
                showAlert = true
            }
        } else {
            deviceCapacity = "Failed to fetch capacity"
        }
    }
    
    func getDeviceCapacity() -> String? {
        let fileManager = FileManager.default
        do {
            let systemAttributes = try fileManager.attributesOfFileSystem(forPath: NSHomeDirectory() as String)
            
            if let freeSize = systemAttributes[.systemFreeSize] as? NSNumber {
                let formattedFreeSpace = ByteCountFormatter.string(fromByteCount: freeSize.int64Value, countStyle: .file)
                return formattedFreeSpace
            }
        } catch {
            print("Error: \(error.localizedDescription)")
        }
        return nil
    }
}

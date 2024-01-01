//
//  String+.swift
//  DeviceCapacityCheckSample
//
//  Created by 永井涼 on 2023/12/31.
//

import Foundation

extension String {
    func convertToMegabytes() -> Double? {
        guard let byteCount = Double(self) else { return nil }
        let megabyte = byteCount / 1024 / 1024
        return megabyte
    }
}

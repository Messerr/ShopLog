//
//  ShopLogAPI.swift
//  shopLog
//
//  Created by David Messer on 4/18/26.
//

import Foundation

enum ShopLogAPI {
    static func fetchTools() async throws -> [ToolData] {
        try await Task.sleep(for: .seconds(1.5))
        return ToolData.sampleData
    }
}

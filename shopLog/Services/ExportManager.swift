//
//  ExportManager.swift
//  shopLog
//
//  Created by David Messer on 4/18/26.
//

import Foundation

@MainActor @Observable
final class ExportManager {
    var isExporting = false
    var progress: Double = 0
    
    func exportAllTools(_ tools: [ToolData]) async {
        isExporting = true
        progress = 0
        defer { isExporting = false }
        
        for (i, _) in tools.enumerated() {
            try? await Task.sleep(for: .milliseconds(200))
            progress = Double(i + 1) / Double(tools.count)
        }
    }
}

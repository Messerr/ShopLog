//
//  ToolStore.swift
//  shopLog
//
//  Created by David Messer on 4/15/26.
//

import Foundation

@Observable
final class ToolStore {
    var tools: [ToolData] = ToolData.sampleData
    var favoriteIDs: Set<UUID> = []
    
    func addTool(_ tool: ToolData) {
        tools.append(tool)
    }
    
    func deleteTool(_ tool: ToolData) {
        tools.removeAll { $0.id == tool.id }
        favoriteIDs.remove(tool.id)
    }
    
    func toggleFavorite(_ tool: ToolData) {
        if favoriteIDs.contains(tool.id) {
            favoriteIDs.remove(tool.id)
        } else {
            favoriteIDs.insert(tool.id)
        }
    }
    
    func isFavorite(_ tool: ToolData) -> Bool {
        favoriteIDs.contains(tool.id)
    }
}

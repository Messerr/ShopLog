//
//  Tool.swift
//  shopLog
//
//  Created by David Messer on 4/20/26.
//

import Foundation
import SwiftData

@Model
final class Tool {
    var name: String
    var type: ToolType
    var diameter: Double
    var overhang: Double
    var fluteCount: Int
    var condition: ToolCondition
    var notes: String
    var dateAdded: Date
    var isFavorite: Bool
    
    @Relationship(deleteRule: .cascade)
    var jobs: [Job] = []
    
    init(
        name: String,
        type: ToolType,
        diameter: Double,
        overhang: Double,
        fluteCount: Int,
        condition: ToolCondition = .new,
        notes: String = ""
    ) {
        self.name = name
        self.type = type
        self.diameter = diameter
        self.overhang = overhang
        self.fluteCount = fluteCount
        self.condition = condition
        self.notes = notes
        self.dateAdded = .now
        self.isFavorite = false
    }
}

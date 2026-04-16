//
//  ToolData.swift
//  shopLog
//
//  Created by David Messer on 4/15/26.
//

import Foundation

struct ToolData: Identifiable, Hashable {
    var id = UUID()
    let name: String
    let type: ToolType
    let diameter: Double
    let fluteCount: Int
    let condition: ToolCondition
    let dateAdded: Date
    
    init(
        name: String,
        type: ToolType,
        diameter: Double,
        fluteCount: Int,
        condition: ToolCondition,
        dateAdded: Date
    ) {
        self.name = name
        self.type = type
        self.diameter = diameter
        self.fluteCount = fluteCount
        self.condition = condition
        self.dateAdded = dateAdded
    }
    
    init(from draft: ToolDraft) {
        self.name = draft.name
        self.type = draft.type
        self.diameter = draft.diameter
        self.fluteCount = draft.fluteCount
        self.condition = draft.condition
        self.dateAdded = Date()
    }
    
    static let sampleData: [ToolData] = [
        ToolData(
            name: "Drill",
            type: .drill,
            diameter: 1.2,
            fluteCount: 12,
            condition: .new,
            dateAdded: Calendar.current.date(byAdding: .month, value: -5, to: .now)!
        ),
        ToolData(
            name: "Endmill",
            type: .endmill,
            diameter: 4.8,
            fluteCount: 10,
            condition: .fair,
            dateAdded: Calendar.current.date(byAdding: .month, value: -3, to: .now)!
        ),
        ToolData(
            name: "Holder",
            type: .reamer,
            diameter: 3.4,
            fluteCount: 5,
            condition: .worn,
            dateAdded: Calendar.current.date(byAdding: .month, value: -3, to: .now)!
        ),
        ToolData(
            name: "Wrench",
            type: .insert,
            diameter: 6.85,
            fluteCount: 2,
            condition: .replace,
            dateAdded: Calendar.current.date(byAdding: .month, value: -1, to: .now)!
        ),
        ToolData(
            name: "Impact Hammer",
            type: .tap,
            diameter: 7.9,
            fluteCount: 9,
            condition: .worn,
            dateAdded: Calendar.current.date(byAdding: .day, value: -10, to: .now)!
        ),
    ]
}

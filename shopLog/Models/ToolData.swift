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
    let notes: String
    
    init(
        name: String,
        type: ToolType,
        diameter: Double,
        fluteCount: Int,
        condition: ToolCondition,
        dateAdded: Date,
        notes: String
    ) {
        self.name = name
        self.type = type
        self.diameter = diameter
        self.fluteCount = fluteCount
        self.condition = condition
        self.dateAdded = dateAdded
        self.notes = notes
    }
    
    init(
        from draft: ToolDraft,
        id: UUID = UUID(),
        dateAdded: Date = Date()
    ) {
        self.id = id
        self.dateAdded = dateAdded
        self.name = draft.name
        self.type = draft.type
        self.diameter = draft.diameter
        self.fluteCount = draft.fluteCount
        self.condition = draft.condition
        self.notes = draft.notes
    }
    
    static let sampleData: [ToolData] = [
        ToolData(
            name: "Drill",
            type: .drill,
            diameter: 1.2,
            fluteCount: 12,
            condition: .new,
            dateAdded: Calendar.current.date(byAdding: .month, value: -5, to: .now)!,
            notes: "Okay tool, but needs a new bit"
        ),
        ToolData(
            name: "Endmill",
            type: .endmill,
            diameter: 4.8,
            fluteCount: 10,
            condition: .fair,
            dateAdded: Calendar.current.date(byAdding: .month, value: -3, to: .now)!,
            notes: "Cool tool, but needs a new bit"
        ),
        ToolData(
            name: "Holder",
            type: .reamer,
            diameter: 3.4,
            fluteCount: 5,
            condition: .worn,
            dateAdded: Calendar.current.date(byAdding: .month, value: -3, to: .now)!,
            notes: "Awesome tool"
        ),
        ToolData(
            name: "Wrench",
            type: .insert,
            diameter: 6.85,
            fluteCount: 2,
            condition: .replace,
            dateAdded: Calendar.current.date(byAdding: .month, value: -1, to: .now)!,
            notes: "Great tool, but needs a new bit"
        ),
        ToolData(
            name: "Impact Hammer",
            type: .tap,
            diameter: 7.9,
            fluteCount: 9,
            condition: .worn,
            dateAdded: Calendar.current.date(byAdding: .day, value: -10, to: .now)!,
            notes: "Fair tool"
        ),
    ]
}

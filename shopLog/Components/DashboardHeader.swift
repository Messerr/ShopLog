//
//  DashboardHeader.swift
//  shopLog
//
//  Created by David Messer on 4/15/26.
//

import SwiftUI
import SwiftData

struct DashboardHeader: View {
    let toolData: [Tool]
    let typeColors: [Color] = [.blue, .orange, .purple, .teal, .pink]
    
    private var groupToolByType: [ToolType: [Tool]] {
        return Dictionary(grouping: toolData, by: \.type)
    }
    
    private var usageByType: [(ToolType, Double, Color)] {
        groupToolByType.sorted(by: {$0.key.displayName < $1.key.displayName }).enumerated().map { index, pair in
            let (type, tools) = pair
            return (type, Double(tools.count) / Double(toolData.count), typeColors[index % typeColors.count])
        }
    }
    
    var body: some View {
        SectionCard(title: "Usage By Type", icon: "hammer") {
        ForEach(usageByType, id: \.0) { usage in
                UsageBar(
                    label: usage.0.displayName,
                    value: usage.1,
                    color: usage.2
                )
            }
        }
    }
}

#Preview {
    DashboardHeader(toolData: [])
        .modelContainer(for: Tool.self, inMemory: true)
}

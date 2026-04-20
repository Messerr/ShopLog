//
//  TypeDistributionChart.swift
//  shopLog
//
//  Created by David Messer on 4/18/26.
//

import SwiftUI
import Charts
import SwiftData

struct TypeDistributionChart: View {
    let tools: [Tool]
    
    var body: some View {
        Chart(ToolType.allCases) { type in
            let count = tools.filter { $0.type == type }.count
            SectorMark(
                angle: .value("Count", count),
                innerRadius: .ratio(0.6),
                angularInset: 2
            )
            .foregroundStyle(by: .value("Type", type.displayName))
            .cornerRadius(4)
        }
        .frame(height: 220)
    }
}

#Preview {
    TypeDistributionChart(tools: [])
        .modelContainer(for: Tool.self, inMemory: true)
}

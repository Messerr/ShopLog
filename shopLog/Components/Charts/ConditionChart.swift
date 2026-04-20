//
//  ConditionChart.swift
//  shopLog
//
//  Created by David Messer on 4/18/26.
//

import SwiftUI
import Charts

struct ConditionChart: View {
    let tools: [ToolData]
    
    var counts: [(ToolCondition, Int)] {
        ToolCondition.allCases.map { c in
            (c, tools.filter { $0.condition == c }.count)
        }.filter { $0.1 > 0 }
    }
    
    var body: some View {
        Chart(counts, id: \.0) { item in
            BarMark(
                x: .value("Count", item.1),
                y: .value("Condition", item.0.displayName)
            )
            .foregroundStyle(item.0.level.color)
            .cornerRadius(6)
            .annotation(position: .trailing) {
                Text("\(item.1)").font(.caption.bold()).foregroundStyle(.secondary)
            }
        }
        .chartXAxis(.hidden)
        .frame(height: CGFloat(counts.count) * 44)
    }
}

#Preview {
    ConditionChart(tools: ToolData.sampleData)
}

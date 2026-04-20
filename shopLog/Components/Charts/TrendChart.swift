//
//  TrendChart.swift
//  shopLog
//
//  Created by David Messer on 4/20/26.
//

import SwiftUI
import Charts

struct TrendChart: View {
    let tools: [ToolData]
    @State private var selectedMonth: Date?

    var monthlyData: [(Date, Int)] {
        let cal = Calendar.current
        let grouped = Dictionary(grouping: tools) {
            cal.dateInterval(of: .month, for: $0.dateAdded)!.start
        }
        return grouped.map { ($0.key, $0.value.count) }.sorted { $0.0 < $1.0 }
    }

    var body: some View {
        Chart(monthlyData, id: \.0) { item in
            BarMark(x: .value("Month", item.0, unit: .month),
                    y: .value("Added", item.1))
            .foregroundStyle(selectedMonth == item.0 ? Color.blue : .blue.opacity(0.6))
            .cornerRadius(4)

            if let sel = selectedMonth,
               let d = monthlyData.first(where: { $0.0 == sel }) {
                RuleMark(x: .value("Sel", sel, unit: .month))
                    .foregroundStyle(.gray.opacity(0.3))
                    .annotation(position: .top) {
                        Text("\(d.1) tools").font(.caption.bold())
                            .padding(6).background(.ultraThinMaterial,
                                in: RoundedRectangle(cornerRadius: 6))
                    }
            }
        }
        .chartOverlay { proxy in
            GeometryReader { geo in
                Rectangle().fill(.clear).contentShape(Rectangle())
                    .onTapGesture { loc in
                        let x = loc.x - geo[proxy.plotFrame!].origin.x
                        if let d: Date = proxy.value(atX: x) {
                            selectedMonth = Calendar.current
                                .dateInterval(of: .month, for: d)?.start
                        }
                    }
            }
        }
        .frame(height: 200)
    }
}

#Preview {
    TrendChart(tools: ToolData.sampleData)
}

//
//  AnalyticsScreen.swift
//  shopLog
//
//  Created by David Messer on 4/18/26.
//

import SwiftUI

struct AnalyticsScreen: View {
    @Environment(ToolStore.self) var store
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                SectionCard(title: "Condition Breakdown", icon: "chart.bar") {
                    ConditionChart(tools: store.tools)
                }
                
                SectionCard(title: "Tool Types", icon: "chart.pie") {
                    TypeDistributionChart(tools: store.tools)
                }
                DashboardHeader(toolData: store.tools)
                
                SectionCard(title: "Trends", icon: "chart.line.uptrend.xyaxis") {
                    TrendChart(tools: store.tools)
                }
            }
            .padding()
        }
    }
}

#Preview {
    AnalyticsScreen()
        .environment(ToolStore())
}

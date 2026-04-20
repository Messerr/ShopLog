//
//  AnalyticsScreen.swift
//  shopLog
//
//  Created by David Messer on 4/18/26.
//

import SwiftUI
import SwiftData

struct AnalyticsScreen: View {
    @Query(sort: \Tool.name) private var tools: [Tool]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                SectionCard(title: "Condition Breakdown", icon: "chart.bar") {
                    ConditionChart(tools: tools)
                }
                
                SectionCard(title: "Tool Types", icon: "chart.pie") {
                    TypeDistributionChart(tools: tools)
                }
                DashboardHeader(toolData: tools)
                
                SectionCard(title: "Trends", icon: "chart.line.uptrend.xyaxis") {
                    TrendChart(tools: tools)
                }
            }
            .padding()
        }
    }
}

#Preview {
    AnalyticsScreen()
}

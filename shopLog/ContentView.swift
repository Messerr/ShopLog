//
//  ContentView.swift
//  shopLog
//
//  Created by David Messer on 4/13/26.
//

import SwiftUI

struct ContentView: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        TabView {
            Tab("Tools", systemImage: "wrench.and.screwdriver") {
                NavigationStack(path: $path) {
                    ToolBrowserScreen()
                        .navigationDestination(for: Tool.self) { tool in
                            ToolDetailScreen(tool: tool)
                        }
                }
            }
            Tab("Analytics", systemImage: "chart.bar") {
                AnalyticsScreen()
            }
        }
    }
}

#Preview {
    ContentView()
}

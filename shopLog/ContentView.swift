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
        NavigationStack(path: $path) {
            ToolBrowserScreen()
                .navigationDestination(for: ToolData.self) { tool in
                    ToolDetailScreen(tool: tool)
                }
        }
    }
}

#Preview {
    ContentView()
        .environment(ToolStore())
}

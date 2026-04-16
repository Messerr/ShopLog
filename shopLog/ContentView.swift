//
//  ContentView.swift
//  shopLog
//
//  Created by David Messer on 4/13/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ToolBrowserScreen()
    }
}

#Preview {
    ContentView()
        .environment(ToolStore())
}

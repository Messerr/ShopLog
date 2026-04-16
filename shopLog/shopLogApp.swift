//
//  shopLogApp.swift
//  shopLog
//
//  Created by David Messer on 4/13/26.
//

import SwiftUI

@main
struct shopLogApp: App {
    @State private var store = ToolStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(store)
        }
    }
}

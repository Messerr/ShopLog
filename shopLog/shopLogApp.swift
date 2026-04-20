//
//  shopLogApp.swift
//  shopLog
//
//  Created by David Messer on 4/13/26.
//

import SwiftUI
import SwiftData

@main
struct shopLogApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [Tool.self, Job.self])
        }
    }
}

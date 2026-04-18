//
//  ExportButton.swift
//  shopLog
//
//  Created by David Messer on 4/18/26.
//

import SwiftUI

struct ExportButton: View {
    @Environment(ToolStore.self) var store
    @State private var exporter = ExportManager()
    @State private var showAlert = false
    
    var body: some View {
        Button {
            Task {
                await exporter.exportAllTools(store.tools)
                showAlert = true
            }
        } label: {
            if exporter.isExporting {
                ProgressView(value: exporter.progress).frame(width: 100)
            } else {
                Label("Export",systemImage: "square.and.arrow.up")
            }
        }
        .disabled(exporter.isExporting)
        .alert("Export Complete", isPresented: $showAlert) {
            Button("OK") { }
        } message: {
            Text("All tools have been successfully exported.")
        }
    }
}

#Preview {
    ExportButton()
        .environment(ToolStore())
}

//
//  AddJobButton.swift
//  shopLog
//
//  Created by David Messer on 4/20/26.
//

import SwiftUI
import SwiftData

struct AddJobButton: View {
    let tool: Tool
    @Environment(\.modelContext) private var context
    @State private var showSheet = false
    @State private var jobName = ""
    @State private var material = ""

    var body: some View {
        Button("Add Job") {
            showSheet = true
        }
        .sheet(isPresented: $showSheet) {
            NavigationStack {
                Form {
                    TextField("Job Name", text: $jobName)
                    TextField("Material", text: $material)
                }
                .navigationTitle("New Job")
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel") { showSheet = false }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Save") {
                            let job = Job(name: jobName, material: material, date: .now, tool: tool)
                            context.insert(job)
                            jobName = ""
                            material = ""
                            showSheet = false
                        }
                        .disabled(jobName.isEmpty || material.isEmpty)
                    }
                }
            }
        }
    }
}

#Preview {
    AddJobButton(tool: Tool(name: "Drill", type: .drill, diameter: 1.2, overhang: 7.5, fluteCount: 4))
        .modelContainer(for: [Tool.self, Job.self], inMemory: true)
}

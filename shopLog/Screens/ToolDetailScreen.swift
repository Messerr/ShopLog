//
//  ToolDetailScreen.swift
//  shopLog
//
//  Created by David Messer on 4/14/26.
//

import SwiftUI
import SwiftData

struct ToolDetailScreen: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) var dismiss
    @State private var showEditSheet = false
    @State private var showDeleteConfirm = false
    let tool: Tool
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                SectionCard(title: "Tool Info", icon: "wrench.and.screwdriver") {
                    LabeledContent("Type", value: tool.type.displayName)
                    LabeledContent("Condition") { ConditionBadge(condition: tool.condition) }
                }
                SectionCard(title: "Dimensions", icon: "ruler") {
                    LabeledContent("Diameter", value: "\(tool.diameter)mm")
                    LabeledContent("Flutes", value: "\(tool.fluteCount)")
                }
                SectionCard(title: "Notes", icon: "note.text") {
                    Text(tool.notes)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                SectionCard(title: "Job History", icon: "clock") {
                    if tool.jobs.isEmpty {
                        Text("No jobs recorded")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    } else {
                        ForEach(tool.jobs) { job in
                            JobRow(job: job)
                        }
                    }
                    AddJobButton(tool: tool)
                }
            }
            .padding()
        }
        .navigationTitle(tool.name)
        .toolbar {
            Menu {
                Button("Edit") { showEditSheet = true }
                Button("Delete", role: .destructive) {
                    showDeleteConfirm = true
                }
            } label: {
                Image(systemName: "ellipsis.circle")
            }
        }
        .sheet(isPresented: $showEditSheet) {
            ToolFormSheet(draft: ToolDraft(), onSave: { draft in
                tool.name = draft.name
                tool.type = draft.type
                tool.diameter = draft.diameter
                tool.overhang = draft.overhang
                tool.fluteCount = draft.fluteCount
                tool.condition = draft.condition
                tool.notes = draft.notes
            }, existingTool: tool)
        }
        .confirmationDialog("Delete \(tool.name)?",
                            isPresented: $showDeleteConfirm,
                            titleVisibility: .visible
        ) {
            Button("Delete Tool", role: .destructive) {
                context.delete(tool)
                dismiss()
            }
        } message: {
            Text("This removes the tool and all its data")
        }
    }
}
#Preview {
    ToolDetailScreen(tool: Tool(name: "Drill", type: .drill, diameter: 1.2, overhang: 7.5, fluteCount: 4))
        .modelContainer(for: [Tool.self, Job.self], inMemory: true)
}

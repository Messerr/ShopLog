//
//  ToolDetailScreen.swift
//  shopLog
//
//  Created by David Messer on 4/14/26.
//

import SwiftUI

struct ToolDetailScreen: View {
    @Environment(ToolStore.self) var store
    @Environment(\.dismiss) var dismiss
    @State private var showEditSheet = false
    @State private var showDeleteConfirm = false
    let tool: ToolData
    
    var body: some View {
        let display = store.tools.first { $0.id == tool.id } ?? tool
        
        ScrollView {
            VStack(spacing: 16) {
                SectionCard(title: "Tool Info", icon: "wrench.and.screwdriver") {
                    LabeledContent("Type", value: display.type.displayName)
                    LabeledContent("Condition") { ConditionBadge(condition: display.condition) }
                }
                SectionCard(title: "Dimensions", icon: "ruler") {
                    LabeledContent("Diameter", value: "\(display.diameter)mm")
                    LabeledContent("Flutes", value: "\(display.fluteCount)")
                }
                SectionCard(title: "Notes", icon: "note.text") {
                    Text(display.notes)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .padding()
        }
        .navigationTitle(display.name)
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
                store.updateTool(display, from: draft)
            }, existingTool: display)
        }
        .confirmationDialog("Delete \(display.name)?",
                            isPresented: $showDeleteConfirm,
                            titleVisibility: .visible
        ) {
            Button("Delete Tool", role: .destructive) {
                store.deleteTool(tool)
                dismiss()
            }
        } message: {
            Text("This removes the tool and all its data")
        }
    }
}
#Preview {
    ToolDetailScreen(tool: ToolData.sampleData[0])
        .environment(ToolStore())
}

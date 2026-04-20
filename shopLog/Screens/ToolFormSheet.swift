//
//  AddToolSheet.swift
//  shopLog
//
//  Created by David Messer on 4/15/26.
//

import SwiftUI

struct ToolFormSheet: View {
    @Bindable var draft: ToolDraft
    var onSave: (ToolDraft) -> Void
    @Environment(\.dismiss) var dismiss
    var existingTool: Tool?
    @State private var hasAttemptedToSave = false
    
    var body: some View {
        NavigationStack {
            ToolFormView(draft: draft, showErrors: $hasAttemptedToSave)
            .navigationTitle(existingTool != nil ? "Edit Tool" : "New Tool")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        hasAttemptedToSave = true
                        if ToolFormValidator(draft: draft).isValid {
                            onSave(draft)
                            dismiss()
                        }
                    }
                }
            }
            .onAppear {
                if let tool = existingTool {
                    draft.name = tool.name
                    draft.type = tool.type
                    draft.diameter = tool.diameter
                    draft.fluteCount = tool.fluteCount
                    draft.condition = tool.condition
                    draft.notes = tool.notes
                    draft.overhang = tool.overhang
                }
            }
        }
    }
}

#Preview {
    ToolFormSheet(draft: ToolDraft(), onSave: { _ in })
}

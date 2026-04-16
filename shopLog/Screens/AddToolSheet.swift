//
//  AddToolSheet.swift
//  shopLog
//
//  Created by David Messer on 4/15/26.
//

import SwiftUI

struct AddToolSheet: View {
    @Bindable var draft: ToolDraft
    var onSave: (ToolDraft) -> Void
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Tool Name", text: $draft.name)
                Picker("Type", selection: $draft.type) {
                    ForEach(ToolType.allCases) { type in
                        Text(type.displayName).tag(type)
                    }
                }
                LabeledContent("Diameter (mm)") {
                    TextField("", value: $draft.diameter, format: .number)
                        .keyboardType(.decimalPad)
                        .multilineTextAlignment(.trailing)
                }
                Stepper("Flutes: \(draft.fluteCount)", value: $draft.fluteCount, in: 1...12)
            }
            .navigationTitle("New Tool")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") { onSave(draft); dismiss() }
                        .disabled(draft.name.isEmpty || draft.diameter <= 0)
                }
            }
        }
    }
}

#Preview {
    AddToolSheet(draft: ToolDraft(), onSave: { _ in })
        .environment(ToolStore())
}

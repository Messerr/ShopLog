//
//  ToolFormView.swift
//  shopLog
//
//  Created by David Messer on 4/18/26.
//

import SwiftUI

struct ToolFormView: View {
    @Bindable var draft: ToolDraft
    @Binding var showErrors: Bool
    private var validator: ToolFormValidator { ToolFormValidator(draft: draft) }
    
    var body: some View {
        Form {
            Section {
                TextField("Tool Name", text: $draft.name)
                    .textInputAutocapitalization(.words)
                Picker("Tool Type", selection: $draft.type) {
                    ForEach(ToolType.allCases) { type in
                        Label(type.displayName, systemImage: type.icon).tag(type)
                    }
                }
            } header: { Text("Identification") }
            footer: {
                if showErrors, let error = validator.nameError {
                    Label(error, systemImage: "exclamationmark.triangle.fill")
                        .font(.caption).foregroundStyle(.red)
                }
            }
            Section {
                LabeledContent("Diameter (mm)") {
                    TextField("", value: $draft.diameter, format: .number)
                        .keyboardType(.decimalPad)
                        .multilineTextAlignment(.trailing)
                }
                Stepper("Flutes: \(draft.fluteCount)", value: $draft.fluteCount, in: 1...12)
                LabeledContent("Overhang (mm)") {
                    TextField("", value: $draft.overhang, format: .number)
                        .keyboardType(.decimalPad)
                        .multilineTextAlignment(.trailing)
                }
            } header: { Text("Dimension") }
              footer: {
                  VStack(alignment: .leading, spacing: 4) {
                      if showErrors, let error = validator.diameterError {
                          Label(error, systemImage: "exclamationmark.triangle.fill")
                              .font(.caption).foregroundStyle(.red)
                      }
                      if showErrors, let error = validator.overhangError {
                          Label(error, systemImage: "exclamationmark.triangle.fill")
                              .font(.caption).foregroundStyle(.red)
                      }
                  }
              }
            
            Section("Condition") {
                Picker("", selection: $draft.condition) {
                    ForEach(ToolCondition.allCases) { c in Text(c.displayName).tag(c) }
                }.pickerStyle(.segmented)
            }
            
            Section("Notes") {
                TextEditor(text: $draft.notes).frame(height: 80)
            }
        }
    }
}

#Preview {
    @Previewable @State var showErrors: Bool = false
    
    ToolFormView(draft: ToolDraft(), showErrors: $showErrors)
}

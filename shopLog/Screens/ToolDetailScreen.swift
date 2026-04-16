//
//  ToolDetailScreen.swift
//  shopLog
//
//  Created by David Messer on 4/14/26.
//

import SwiftUI

struct ToolDetailScreen: View {
    let tool: ToolData
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                SectionCard(title: "Tool Info", icon: "wrench.and.screwdriver") {
                    LabeledContent("Name", value: tool.name)
                    LabeledContent("Diameter", value: String(tool.diameter))
                    LabeledContent("Flute Count", value: String(tool.fluteCount))
                }
                SectionCard(title: "Similar Tools", icon: "square.stack.3d.up") {
                    ToolCard(tool: ToolData.sampleData[0])
                    ToolCard(tool: ToolData.sampleData[1])
                    ToolCard(tool: ToolData.sampleData[2])
                }
                SectionCard(title: "Notes", icon: "note.text") {
                    Text("Some notes about this tool")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .padding()
        }
    }
}

#Preview {
    ToolDetailScreen(tool: ToolData.sampleData[0])
        .environment(ToolStore())
}

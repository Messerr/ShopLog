//
//  CompactToolCard.swift
//  shopLog
//
//  Created by David Messer on 4/15/26.
//

import SwiftUI
import SwiftData

struct CompactToolCard: View {
    let tool: Tool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(tool.name).font(.subheadline.bold())
                Spacer()
                Circle()
                    .fill(tool.condition.level.color)
                    .frame(width: 8, height: 8)
            }
            Text("\(tool.type.displayName) · ⌀\(String(tool.diameter))")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .padding(14)
        .background(.background, in: RoundedRectangle(cornerRadius: 10))
        .shadow(color: .black.opacity(0.04), radius: 4, y: 2)
    }
}

#Preview {
    CompactToolCard(tool: Tool(name: "Drill", type: .drill, diameter: 1.2, overhang: 7.5, fluteCount: 4))
        .modelContainer(for: [Tool.self, Job.self], inMemory: true)
}

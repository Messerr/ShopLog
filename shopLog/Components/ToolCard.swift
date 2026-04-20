//
//  ToolCard.swift
//  shopLog
//
//  Created by David Messer on 4/14/26.
//

import SwiftUI
import SwiftData

struct ToolCard: View {
    let tool: Tool
    
    var body: some View {
        HStack(spacing: 14) {
            RoundedRectangle(cornerRadius: 2)
                .fill(tool.condition.level.color)
                .frame(width: 4, height: 50)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(tool.name)
                    .font(.headline)
                Text("\(tool.type.displayName) · ⌀\(String(tool.diameter))")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
            
            ConditionBadge(condition: tool.condition)
            
            Button {
                tool.isFavorite.toggle()
            } label: {
                Image(systemName: tool.isFavorite ? "heart.fill" : "heart")
            }
        }
        .padding(16)
        .background(.background)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(color: .black.opacity(0.06), radius: 4, y: 2
        )
    }
}

#Preview {
    ToolCard(tool: Tool(name: "Drill", type: .drill, diameter: 1.2, overhang: 7.5, fluteCount: 4))
        .modelContainer(for: [Tool.self, Job.self], inMemory: true)
}

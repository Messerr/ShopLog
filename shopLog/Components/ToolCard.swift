//
//  ToolCard.swift
//  shopLog
//
//  Created by David Messer on 4/14/26.
//

import SwiftUI

struct ToolCard: View {
    @Environment(ToolStore.self) var store
    let tool: ToolData
    
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
                store.toggleFavorite(tool)
            } label: {
                Image(systemName: store.isFavorite(tool) ? "heart.fill" : "heart")
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
    let store = ToolStore()
    
    VStack(spacing: 12) {
    ToolCard(
        tool: ToolData.sampleData[0]
    )
    }
    .padding()
    .environment(store)
}

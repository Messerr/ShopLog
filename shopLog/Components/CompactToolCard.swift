//
//  CompactToolCard.swift
//  shopLog
//
//  Created by David Messer on 4/15/26.
//

import SwiftUI

struct CompactToolCard: View {
    let tool: ToolData
    
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
    CompactToolCard(tool: ToolData.sampleData[0])
}

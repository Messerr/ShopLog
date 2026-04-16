//
//  UsageBar.swift
//  shopLog
//
//  Created by David Messer on 4/15/26.
//

import SwiftUI

struct UsageBar: View {
    let label: String
    let value: Double
    let color: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack {
                Text(label).font(.caption.weight(.medium))
                Spacer()
                Text("\(Int(value * 100))%")
                    .font(.caption.weight(.bold))
                    .foregroundStyle(color)
            }
            GeometryReader { proxy in
                ZStack(alignment: .leading) {
                    Capsule().fill(color.opacity(0.15))
                    Capsule().fill(color)
                        .frame(width: proxy.size.width * value)
                }
            }
            .frame(height: 8)
        }
    }
}

#Preview {
    UsageBar(
        label: "Usage",
        value: 0.15,
        color: .green
    )
}

//
//  StatusPill.swift
//  shopLog
//
//  Created by David Messer on 4/14/26.
//

import SwiftUI

struct StatusPill: View {
    let label: String
    let level: StatusLevel
    
    enum StatusLevel {
        case good, warning, critical
        
        var color: Color {
            switch self {
            case .good: .green
            case .warning: .orange
            case .critical: .red
            }
        }
    }
    
    var body: some View {
        Text(label)
            .font(.caption.weight(.semibold))
            .padding(.horizontal, 10)
            .padding(.vertical, 4)
            .background(level.color, in: Capsule())
            .foregroundStyle(.white)
    }
}

#Preview {
    StatusPill(label: "In Use", level: .good)
    StatusPill(label: "Worn", level: .warning)
    StatusPill(label: "Replace", level: .critical)
}

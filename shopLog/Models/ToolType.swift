//
//  ToolType.swift
//  shopLog
//
//  Created by David Messer on 4/15/26.
//

import Foundation

enum ToolType: String, CaseIterable, Identifiable, Hashable, Codable {
    var id: Self { self }
    case endmill
    case drill
    case insert
    case reamer
    case tap
    
    var displayName: String {
        switch self {
        case .endmill: return "Endmill"
        case .drill: return "Drill"
        case .insert: return "Insert"
        case .reamer: return "Reamer"
        case .tap: return "Tap"
        }
    }
    
    var icon: String {
        switch self {
        case .endmill: return "cylinder.fill"
        case .drill: return "arrow.down.circle"
        case .insert: return "square.stack"
        case .reamer: return "screwdriver"
        case .tap: return "minus.circle"
        }
    }
}

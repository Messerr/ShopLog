//
//  ToolCondition.swift
//  shopLog
//
//  Created by David Messer on 4/14/26.
//

import Foundation

enum ToolCondition: Int, CaseIterable, Identifiable, Hashable {
    var id: Self { self }
    case new, good, fair, worn, replace
    
    var displayName: String {
        switch self {
        case .new: "New"
        case .good: "Good"
        case .fair: "Fair"
        case .worn: "Worn"
        case .replace: "Replace"
        }
    }
    
    var level: StatusPill.StatusLevel {
        switch self {
        case .new: .good
        case .good: .good
        case .fair: .warning
        case .worn: .warning
        case .replace: .critical
        }
    }
}



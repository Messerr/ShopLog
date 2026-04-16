//
//  SortOrder.swift
//  shopLog
//
//  Created by David Messer on 4/15/26.
//

import Foundation

enum SortOrder: CaseIterable {
    case name, date, condition
    
    var label: String {
        switch self {
        case .name: "Name"
        case .date: "Date Added"
        case .condition: "Condition"
        }
    }
}

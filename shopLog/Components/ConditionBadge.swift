//
//  ConditionBadge.swift
//  shopLog
//
//  Created by David Messer on 4/14/26.
//

import SwiftUI

struct ConditionBadge: View {
    let condition: ToolCondition
    
    var body: some View {
        StatusPill(label: condition.displayName, level: condition.level)
    }
}

#Preview {
    ForEach(ToolCondition.allCases) { condition in
        ConditionBadge(condition: condition)
    }
}

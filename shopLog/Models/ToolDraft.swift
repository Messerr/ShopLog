//
//  ToolDraft.swift
//  shopLog
//
//  Created by David Messer on 4/15/26.
//

import Foundation

@Observable
final class ToolDraft {
    var name = ""
    var type: ToolType = .endmill
    var diameter: Double = 0
    var fluteCount: Int = 4
    var overhang: Double = 0
    var notes = ""
    var condition: ToolCondition = .new
}

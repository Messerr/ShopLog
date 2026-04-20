//
//  Job.swift
//  shopLog
//
//  Created by David Messer on 4/20/26.
//

import Foundation
import SwiftData

@Model
final class Job {
    var name: String
    var material: String
    var date: Date
    var tool: Tool?
    
    init(
        name: String,
        material: String,
        date: Date,
        tool: Tool
    ) {
        self.name = name
        self.material = material
        self.date = date
        self.tool = tool
    }
}

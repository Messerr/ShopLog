//
//  ToolFormValidator.swift
//  shopLog
//
//  Created by David Messer on 4/18/26.
//

import Foundation

struct ToolFormValidator {
    let draft: ToolDraft
    
    var nameError: String? {
        let t = draft.name.trimmingCharacters(in: .whitespacesAndNewlines)
        if t.isEmpty { return "Tool name is required" }
        if t.count < 2 { return "Name must be at least 2 characters" }
        return nil
    }
    
    var diameterError: String? {
        if draft.diameter <= 0 { return "Diameter must be > 0" }
        if draft.diameter > 200 { return "Diameter exceed 200mm max" }
        return nil
    }
    
    var overhangError: String? {
        if draft.overhang <= 0 { return "Overhang must be > 0" }
        if draft.overhang < draft.diameter {
            return "Overhang must be >= diameter (\(draft.diameter)mm)"
        }
        return nil
    }
    
    var allErrors: [String] { [nameError, diameterError, overhangError].compactMap { $0 } }
    var isValid: Bool { allErrors.isEmpty }
}

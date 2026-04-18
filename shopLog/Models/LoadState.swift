//
//  LoadState.swift
//  shopLog
//
//  Created by David Messer on 4/18/26.
//

import Foundation

enum LoadState<T> {
    case idle, loading, loaded(T), error(String)
    
    var shouldReload: Bool {
        if case .idle = self { return true }
        return false
    }
}

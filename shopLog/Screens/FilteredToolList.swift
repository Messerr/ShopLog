//
//  FilteredToolList.swift
//  shopLog
//
//  Created by David Messer on 4/20/26.
//

import SwiftUI
import SwiftData

struct FilteredToolList: View {
    @Query private var tools: [Tool]

    init(searchText: String, sortOrder: SortOrder) {
        let sort: SortDescriptor<Tool> = switch sortOrder {
        case .name: SortDescriptor(\Tool.name)
        case .date: SortDescriptor(\Tool.dateAdded, order: .reverse)
        case .condition: SortDescriptor(\Tool.condition.rawValue)
        }
        if searchText.isEmpty {
            _tools = Query(sort: [sort])
        } else {
            _tools = Query(
                filter: #Predicate<Tool> {
                    $0.name.localizedStandardContains(searchText)
                },
                sort: [sort]
            )
        }
    }

    var body: some View { /* your grid/list */ }
}

#Preview {
    FilteredToolList(searchText: "", sortOrder: .name)
        .modelContainer(for: [Tool.self, Job.self], inMemory: true)
}

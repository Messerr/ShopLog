//
//  ToolBrowserScreen.swift
//  shopLog
//
//  Created by David Messer on 4/15/26.
//

import SwiftUI
import SwiftData

struct ToolBrowserScreen: View {
    @Query(sort: \Tool.name) private var tools: [Tool]
    @Environment(\.modelContext) private var context
    @State private var showFavoriteOnly = false
    @State private var searchText = ""
    @State private var viewMode: ViewMode = .grid
    @State private var sortOrder: SortOrder = .name
    @State private var showAddSheet = false
    @State private var newDraft = ToolDraft()

    var filteredTools: [Tool] {
        var result = searchText.isEmpty ? tools
        : tools.filter { $0.name.localizedCaseInsensitiveContains(searchText) }

        if showFavoriteOnly {
            result = result.filter { $0.isFavorite }
        }

        return result.sorted {
            switch sortOrder {
            case .name: $0.name < $1.name
            case .date: $0.dateAdded > $1.dateAdded
            case .condition: $0.condition.rawValue < $1.condition.rawValue
            }
        }
    }

    var body: some View {
        ScrollView {
            ShopLogHeader(
                title: "Tools",
                toolCount: filteredTools.count
            )

            ToolBrowserToolBar(viewMode: $viewMode, sortOrder: $sortOrder, showFavoritesOnly: $showFavoriteOnly)

            DashboardHeader(toolData: filteredTools)

            switch viewMode {
            case .grid:
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 160))]) {
                    ForEach(filteredTools) { tool in
                        NavigationLink(value: tool) {
                            CompactToolCard(tool: tool)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding()
            case .list:
                LazyVStack {
                    ForEach(filteredTools) { tool in
                        NavigationLink(value: tool) {
                            ToolCard(tool: tool)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding()
            }
        }
        .searchable(text: $searchText, prompt: "Search tools...")
        .sheet(isPresented: $showAddSheet) {
            ToolFormSheet(draft: newDraft, onSave: { draft in
                let newTool = Tool(
                    name: draft.name,
                    type: draft.type,
                    diameter: draft.diameter,
                    overhang: draft.overhang,
                    fluteCount: draft.fluteCount,
                    condition: draft.condition,
                    notes: draft.notes
                )
                context.insert(newTool)
                newDraft = ToolDraft()
            })
        }
        .toolbar {
            ToolbarItem {
                Button {
                    showAddSheet = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            ToolbarItem {
                ExportButton(tools: filteredTools)
            }
        }
    }
}

#Preview {
    ToolBrowserScreen()
        .modelContainer(for: [Tool.self, Job.self], inMemory: true)
}

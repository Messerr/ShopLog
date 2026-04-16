//
//  ToolBrowserToolBar.swift
//  shopLog
//
//  Created by David Messer on 4/15/26.
//

import SwiftUI

struct ToolBrowserToolBar: View {
    @Binding var viewMode: ViewMode
    @Binding var sortOrder: SortOrder
    @Binding var showFavoritesOnly: Bool
    
    var body: some View {
        HStack {
            Picker("View", selection: $viewMode) {
                Image(systemName: "list.bullet").tag(ViewMode.list)
                Image(systemName: "square.grid.2x2").tag(ViewMode.grid)
            }
            .pickerStyle(.segmented)
            .frame(width: 100)
            
            Spacer()
            
            Menu {
                Button("Name") { sortOrder = .name }
                Button("Date") { sortOrder = .date }
                Button("Condition") { sortOrder = .condition }
            } label: {
                Image(systemName: "arrow.up.arrow.down.circle")
            }
            
            Button(action: { showFavoritesOnly.toggle() }) {
                Image(systemName: showFavoritesOnly ? "heart.fill" : "heart")
            }
        }
        .padding()
    }
}

#Preview {
    @Previewable @State var viewMode: ViewMode = .grid
    @Previewable @State var sortOrder: SortOrder = .name
    @Previewable @State var showFavoritesOnly: Bool = false
    
    ToolBrowserToolBar(viewMode: $viewMode, sortOrder: $sortOrder, showFavoritesOnly: $showFavoritesOnly)
}

//
//  Header.swift
//  shopLog
//
//  Created by David Messer on 4/15/26.
//

import SwiftUI

struct ShopLogHeader: View {
    let title: String
    let toolCount: Int
    
    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.largeTitle.bold())
                Text("\(toolCount) tools")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
            

        }
        .padding(.horizontal)
    }
}

#Preview {
    ShopLogHeader(title: "Tool Header", toolCount: 5)
}

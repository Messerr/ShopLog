//
//  JobRow.swift
//  shopLog
//
//  Created by David Messer on 4/20/26.
//

import SwiftUI
import SwiftData

struct JobRow: View {
    let job: Job

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(job.name)
                    .font(.subheadline.weight(.medium))
                Text(job.material)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            Text(job.date, format: .dateTime.month(.abbreviated).day().year())
                .font(.caption)
                .foregroundStyle(.tertiary)
        }
    }
}

#Preview {
    JobRow(job: Job(name: "Facing Op", material: "Aluminum", date: .now, tool: Tool(name: "Drill", type: .drill, diameter: 1.2, overhang: 7.5, fluteCount: 4)))
        .modelContainer(for: [Tool.self, Job.self], inMemory: true)
}

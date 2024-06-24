//
//  WorkoutSummaryView.swift
//  Workoutable
//
//  Created by Patryk Rybak on 30/05/2024.
//

import SwiftUI

struct WorkoutSummaryView: View {
    let title: String
    let date: Date
    let time: Int
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    HStack {
                        Text("Date:").bold()
                        Text("\(date, format: Date.FormatStyle(date: .long))")
                    }
                    HStack {
                        Text("Duration:").bold()
                        Text("\(time) minutes")
                    }
                } header: {
                    Text("Details:")
                }
                
                
//                Section {
//                    Text("One")
//                    Text("Two")
//                    Text("Three")
//                } header: {
//                    Text("Second Section Header")
//                } footer: {
//                    Text("Tempora distinctio excepturi quasi distinctio est voluptates voluptate et dolor iste nisi voluptatem labore ipsum blanditiis sed sit suscipit est.")
//                }
                
            }
            .navigationTitle(title)
            .listStyle(.plain)
        }
    }
}

#Preview {
    WorkoutSummaryView(title: "Preview", date: Date(), time: 0)
}

//
//  ReportSportDetailsView.swift
//  Workoutable
//
//  Created by Patryk Rybak on 28/05/2024.
//

import SwiftUI
import SwiftData

struct ReportSportDetailsView: View {
    @ObservedObject var sheetManager: ReportSportManager
    @Environment(\.modelContext) private var modelContext
    @Query private var workouts: [WorkoutItem]
    @State private var currentDate = Date()
    @State private var trainingDuration = ""
    let sportName: String
    
    init(sportName: String, sheetManager: ReportSportManager) {
        self.sportName = sportName
        self.sheetManager = sheetManager
    }

    var body: some View {
        
            Form {
                Section(header: Text("Training Details")) {
                    DatePicker("Date", selection: $currentDate, in: ...Date(), displayedComponents: .date)
                    TextField("Training Duration (minutes)", text: $trainingDuration)
                        .keyboardType(.numberPad)
                }
                Section {
                    Button(action: {
                            addWorkout()
                            sheetManager.isSheetPresented.toggle()
                    }) {
                        Text("Save")
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                }
            }
            .navigationTitle(sportName)
            .navigationBarTitleDisplayMode(.inline)
    }
    
    private func addWorkout() {
        withAnimation {
            let duration = Int(trainingDuration) ?? 0
            let newItem = WorkoutItem(title: sportName, date: currentDate, time: duration)
            modelContext.insert(newItem)
        }
    }
}

#Preview {
    ReportSportDetailsView(sportName: "", sheetManager: ReportSportManager())
}

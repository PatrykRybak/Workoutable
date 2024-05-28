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
//    @Environment(\.presentationMode) var presentationMode
    @Environment(\.modelContext) private var modelContext
    @Query private var workouts: [WorkoutItem]
    @State private var currentDate = Date()
    @State private var trainingDuration = "0"
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
                    Button("Save") {
                        addWorkout()
                        sheetManager.isSheetPresented.toggle()
//                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
            .navigationTitle(sportName)
            .navigationBarTitleDisplayMode(.inline)
    }
    
    private func addWorkout() {
        withAnimation {
            let newItem = WorkoutItem(title: sportName, date: Date(), time: Int(trainingDuration)!)
            modelContext.insert(newItem)
        }
    }
}

#Preview {
    ReportSportDetailsView(sportName: "", sheetManager: ReportSportManager())
}

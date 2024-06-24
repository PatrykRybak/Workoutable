//
//  WorkoutBuilderView.swift
//  Workoutable
//
//  Created by Patryk Rybak on 29/05/2024.
//

import SwiftUI
import SwiftData

struct WorkoutBuilderView: View {
    @StateObject var sheetManager = AddExerciseManager()
    @Environment(\.modelContext) private var modelContext
    @Query private var exercises: [ExerciseItem]
    
    var body: some View {
        VStack{
            if exercises.isEmpty {
                Text("No workouts")
                    .font(.headline)
                    .foregroundColor(.gray)
                    .padding()
            }
            else{
                List {
                    Section{
                        ForEach(exercises) { exercise in
                            Text(exercise.name)
                        }.onDelete(perform: deleteItems)
                    }header: {
                        Text("Avaliable:")
                    }
                }
            }
        }
        .navigationTitle("Workouts")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Create workout", systemImage: "plus"){
                    sheetManager.isSheetPresented.toggle()
                }
            }
        }
        .sheet(isPresented: $sheetManager.isSheetPresented) {
//            ReportSportView(sheetManager: sheetManager).presentationDetents([.medium])
            AddExercise(sheetManager: sheetManager).presentationDetents([.medium])
//            AddExercise(sheetManager: sheetManager).presentationDetents([.medium])
//            Text("xd").presentationDetents([.medium])
        }
    }
        
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(exercises[index])
            }
        }
    }
}

#Preview {
    WorkoutBuilderView()
}

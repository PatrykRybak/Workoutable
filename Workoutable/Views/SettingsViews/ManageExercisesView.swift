//
//  ManageExercisesView.swift
//  Workoutable
//
//  Created by Patryk Rybak on 29/05/2024.
//

import SwiftUI
import SwiftData

struct ManageExercisesView: View {
    @StateObject var sheetManager = AddExerciseManager()
    @Environment(\.modelContext) private var modelContext
    @Query private var exercises: [ExerciseItem]
    
    var body: some View {
        VStack{
            if exercises.isEmpty {
                Text("No exercises")
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
        .navigationTitle("Exercises")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Create exercise", systemImage: "plus"){
                    sheetManager.isSheetPresented.toggle()
                }
            }
        }
        .sheet(isPresented: $sheetManager.isSheetPresented) {
            AddExercise(sheetManager: sheetManager)
                .presentationDetents([.height(225)])
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
    ManageExercisesView()
        .modelContainer(for: ExerciseItem.self, inMemory: true)
}
    

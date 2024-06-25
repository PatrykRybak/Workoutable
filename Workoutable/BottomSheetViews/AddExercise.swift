//
//  AddExercise.swift
//  Workoutable
//
//  Created by Patryk Rybak on 28/05/2024.
//

import SwiftUI
import SwiftData

struct AddExercise: View {
    @ObservedObject var sheetManager: AddExerciseManager
    @Environment(\.modelContext) private var modelContext
    @Query private var exercises: [ExerciseItem]
    @State private var exerciseName = ""
    @State private var formIsValid = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Details")) {
                    TextField("Exercise name", text: $exerciseName).keyboardType(.default).onChange(of: exerciseName){
                        if(exerciseName != "") {
                            formIsValid = true
                        }
                        else {
                            formIsValid = false
                        }
                    }
                }
                Section {
                    Button(action: {
                        if(exerciseName != ""){
                            addExercise()
                            sheetManager.isSheetPresented.toggle()
                        }
                    }) {
                        Text("Add")
                            .frame(maxWidth: .infinity, alignment: .center)
                    }.disabled(!formIsValid)
                }
            }
            .navigationTitle("Add exercise")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    private func addExercise() {
        withAnimation {
            let newItem = ExerciseItem(name: exerciseName)
            modelContext.insert(newItem)
        }
    }
}

#Preview {
    AddExercise(sheetManager: AddExerciseManager())
}

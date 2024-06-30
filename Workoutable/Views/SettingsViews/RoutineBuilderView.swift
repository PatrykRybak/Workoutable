//
//  WorkoutBuilderView.swift
//  Workoutable
//
//  Created by Patryk Rybak on 29/05/2024.
//

import SwiftUI
import SwiftData

struct RoutineBuilderView: View {
    @Binding var path: NavigationPath
    @Environment(\.dismiss) var dismiss
    
    // Form data
    @State private var routineName = ""
    @State private var warmUp = false
    @State private var coolDown = false
    @State private var circuitTraining = false
    @State private var circuitRepetition = 2
    
    // Form validation
    @State private var formIsValid = false
    
    @State private var exercises: [String] = [
        "Push-ups", "Sit-ups", "Squats", "Lunges", "Burpees",
        "Plank", "Jumping Jacks", "Mountain Climbers", "Crunches", "Leg Raises"
    ]
    
    var body: some View {
        NavigationStack(path: $path){
            VStack{
                Form {
                    Section(header: Text("Routine details:")) {
                        TextField("Routine name", text: $routineName).keyboardType(.default).onChange(of: routineName){
                            if(routineName != "") {
                                formIsValid = true
                            }
                            else {
                                formIsValid = false
                            }
                        }
                        Toggle("Warm-up", isOn: $warmUp)
                        Toggle("Cool-down", isOn: $coolDown)
                        Toggle("Circuit training", isOn: $circuitTraining)
                        if(circuitTraining == true){
                            Stepper("Repeat \(circuitRepetition.formatted()) times", value: $circuitRepetition, in: 2...100, step: 1)
                        }
                    }
                    
                    Section{
                        List {
                            ForEach(exercises.indices, id: \.self) { index in
                                HStack {
                                    Text(exercises[index])
                                }
                            }
                            .onDelete(perform: delete)
                            .onMove(perform: move)
                        }
                        
                        
                    }header: {
                        Text("Exercises:")
                    }
                    
                    Section {
                            Button(action: {
                                dismiss()
                            }) {
                                Text("Create routine").frame(maxWidth: .infinity, alignment: .center)
                            }.disabled(!formIsValid)
                        }
          
                }
            }
            .navigationTitle("Routine builder")
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel", systemImage: "xmark"){
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add", systemImage: "plus"){
                        clearForm()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Discard", systemImage: "trash"){
                        clearForm()
                    }
                }
            }
        }
    }
    
    private func move(from source: IndexSet, to destination: Int) {
        exercises.move(fromOffsets: source, toOffset: destination)
    }
    
    private func delete(at offsets: IndexSet) {
        exercises.remove(atOffsets: offsets)
    }
    
    private func clearForm() {
        routineName = ""
        warmUp = false
        coolDown = false
        circuitTraining = false
        circuitRepetition = 2
        exercises.removeAll()
    }
}

#Preview {
    RoutineBuilderView(path: .constant(NavigationPath()))
}

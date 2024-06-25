//
//  WorkoutBuilderView.swift
//  Workoutable
//
//  Created by Patryk Rybak on 29/05/2024.
//

import SwiftUI
import SwiftData

struct RoutineBuilderView: View {
    // Form data
    @State private var routineName = ""
    @State private var warmUp = false
    @State private var coolDown = false
    @State private var circuitTraining = false
    @State private var circuitRepetition = 2
    
    // Form validation
    @State private var formIsValid = false
    
    var body: some View {
        NavigationStack{
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
                    
                    Section {
                        NavigationLink(destination: RoutineBuilderTwoView()) {
                            Button(action: {}) {
                                Text("Next").frame(maxWidth: .infinity, alignment: .center)
                            }
                        }.disabled(!formIsValid)
                    }
                }
            }
            .navigationTitle("Routine builder")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Discard", systemImage: "trash"){
                        clearForm()
                    }
                }
            }
        }
    }
    
    private func clearForm() {
        routineName = ""
        warmUp = false
        coolDown = false
        circuitTraining = false
        circuitRepetition = 2
    }
}

#Preview {
    RoutineBuilderView()
}

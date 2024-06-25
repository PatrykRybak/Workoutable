//
//  RoutineBuilderTwoView.swift
//  Workoutable
//
//  Created by Patryk Rybak on 25/06/2024.
//

import SwiftUI

struct RoutineBuilderTwoView: View {
    // Form data
//    @State private var routineName = ""
//    @State private var warmUp = false
//    @State private var coolDown = false
//    @State private var circuitTraining = false
//    @State private var circuitRepetition = 2
    @State private var exercises: [String] = [
        "Push-ups", "Sit-ups", "Squats", "Lunges", "Burpees",
        "Plank", "Jumping Jacks", "Mountain Climbers", "Crunches", "Leg Raises"
    ]
    
    
    var body: some View {
        NavigationStack{
            VStack{
                if exercises.isEmpty {
                    Text("Please select exercises")
                        .font(.headline)
                        .foregroundColor(.gray)
                        .padding()
                }
                else{
                    List {
                        Section{
                            ForEach(exercises.indices, id: \.self) { index in
                                HStack {
                                    Text(exercises[index])
                                }
                            }
                            .onDelete(perform: delete)
                            .onMove(perform: move)
                        }header: {
                            Text("Your routine:")
                        }
                        Section{
                            NavigationLink(destination: SettingsView()) {
                                Button(action: {}) {
                                    Text("Create routine").frame(maxWidth: .infinity, alignment: .center)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Pick exercises")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("add", systemImage: "plus"){
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
        exercises.removeAll()
    }
}

#Preview {
    RoutineBuilderTwoView()
}

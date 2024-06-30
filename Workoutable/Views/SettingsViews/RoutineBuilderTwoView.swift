//
//  RoutineBuilderTwoView.swift
//  Workoutable
//
//  Created by Patryk Rybak on 25/06/2024.
//

import SwiftUI

struct RoutineBuilderTwoView: View {
    @Binding var path: NavigationPath
    @Environment(\.dismiss) var dismiss
    // Form data
    @State private var exercises: [String] = [
        "Push-ups", "Sit-ups", "Squats", "Lunges", "Burpees",
        "Plank", "Jumping Jacks", "Mountain Climbers", "Crunches", "Leg Raises"
    ]
    
    var body: some View {
        NavigationStack(path: $path){
            VStack{
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
                    
                    if !exercises.isEmpty {
                        Section{
//                            NavigationLink(destination: SettingsView()) {
                                Button(action: {
                                    path.removeLast(path.count)
                                    print(path)
                                }) {
                                    Text("Create routine").frame(maxWidth: .infinity, alignment: .center)
                                }
//                            }
                        }
                    }
                    
                }
            }
            .navigationTitle("Exercise picker")
            .toolbar {
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
    RoutineBuilderTwoView(path: .constant(NavigationPath()))
}

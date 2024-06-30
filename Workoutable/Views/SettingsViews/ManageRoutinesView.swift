//
//  ManageRoutinesView.swift
//  Workoutable
//
//  Created by Patryk Rybak on 24/06/2024.
//

import SwiftUI
import SwiftData

struct ManageRoutinesView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var routines: [RoutineItem]
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path){
            VStack{
                if routines.isEmpty {
                    Text("No routines")
                        .font(.headline)
                        .foregroundColor(.gray)
                        .padding()
                }
                else{
                    List {
                        Section{
                            ForEach(routines) { exercise in
                                Text(exercise.name)
                            }.onDelete(perform: deleteItems)
                        }header: {
                            Text("Avaliable:")
                        }
                    }
                }
            }
            .navigationTitle("Routines")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: RoutineBuilderView(path: $path)) {
                        Label("Create exercise", systemImage: "plus")
                    }
                }
            }
        }
    }
        
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(routines[index])
            }
        }
    }
}

#Preview {
    ManageRoutinesView()
        .modelContainer(for: ExerciseItem.self, inMemory: true)
}

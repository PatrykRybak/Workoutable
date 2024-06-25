//
//  SettingsView.swift
//  Workoutable
//
//  Created by Patryk Rybak on 28/05/2024.
//

import SwiftUI
import SwiftData

struct SettingsView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var workouts: [WorkoutItem]
    
    @State private var isShowingDeletelert = false
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack{
            VStack{
                List{
                    Section("Workouts"){
                        NavigationLink(destination: ManageRoutinesView()) {
                            Label("Routine builder", systemImage: "figure.run.square.stack")
                                .accentColor(.accentColor)
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        NavigationLink(destination: ManageExercisesView()) {
                            Label("Manage exercises", systemImage: "dumbbell")
                                .accentColor(.accentColor)
                        }
                        .buttonStyle(PlainButtonStyle())
                
                    }
                    Section("Preferences"){
                        Button{
                            isShowingDeletelert = true
                        } label: {
                            Label("Clear history", systemImage: "clock.arrow.circlepath").accentColor(.red)
                        }.confirmationDialog("It's a very long time!", isPresented: $isShowingDeletelert, titleVisibility: .visible){
                            Button("Clear", role: .destructive){
                                deleteAllItems()
                            }
                        }
                    }
                }
            }
            .navigationTitle("Settings")
        }
    }
    
    private func deleteAllItems() {
        withAnimation {
            for workout in workouts {
                modelContext.delete(workout)
            }
            do {
                try modelContext.save()
            } catch {
                print("Failed to save context: \(error)")
            }
        }
    }
}

#Preview {
    SettingsView()
        .modelContainer(for: WorkoutItem.self, inMemory: true)
}

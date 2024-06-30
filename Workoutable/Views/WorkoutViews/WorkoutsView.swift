//
//  WorkoutsView.swift
//  Workoutable
//
//  Created by Patryk Rybak on 28/05/2024.
//

import SwiftUI
import SwiftData

struct WorkoutsView: View {
    @StateObject var sportSheetManager = ReportSportManager()
    @StateObject var routineSheetManager = ReportRoutineManager()
    @Environment(\.modelContext) private var modelContext
    @Query private var workouts: [WorkoutItem]
    @State private var showStruggleView = false

    var body: some View {
        NavigationSplitView {
            VStack{
                if workouts.isEmpty {
                    Text("No workouts yet...")
                        .font(.headline)
                        .foregroundColor(.gray)
                        .padding()
                }
                else{
                    List {
                        Section{
                            ForEach(workouts) { workout in
                                NavigationLink {
                                    WorkoutSummaryView(title: workout.title, date: workout.date, time: workout.time)
                                } label: {
                                    HStack {
                                        Text(workout.title).bold()
                                        Text("– \(workout.date, format: Date.FormatStyle(date: .long))")
                                    }
                                }
                            }.onDelete(perform: deleteItems)
                        }header: {
                            Text("Training history:")
                        }
                    }
                }
            }
            .navigationTitle("Workouts 🔥")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu{
                            Button("Routines", systemImage: "dumbbell"){
//                                addWorkout()
                                routineSheetManager.isSheetPresented.toggle()
                            }
                            Button("Sports", systemImage: "flag.checkered.2.crossed"){
                                sportSheetManager.isSheetPresented.toggle()
                            }
                    } label: {
                        Label("Workout", systemImage: "plus").accentColor(.red)
                    }
                }
            }
        } detail: {
            Text("Workouts")
        }
        .sheet(isPresented: $sportSheetManager.isSheetPresented, content: {
            ReportSportView(sheetManager: sportSheetManager).presentationDetents([.medium])
        })
        .sheet(isPresented: $routineSheetManager.isSheetPresented) {
            ReportRoutineView(sheetManager: routineSheetManager, showStruggleView: $showStruggleView)
                .presentationDetents([.medium])
        }
        .navigationDestination(for: String.self) { destination in
            if destination == "StruggleView" {
                StruggleView()
            }
        }
    }

    private func addWorkout() {
        withAnimation {
            let newItem = WorkoutItem(title: "GG", date: Date(), time: 0)
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(workouts[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: WorkoutItem.self, inMemory: true)
}

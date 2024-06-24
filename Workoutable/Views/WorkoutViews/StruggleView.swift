//
//  StruggleView.swift
//  Workoutable
//
//  Created by Patryk Rybak on 28/05/2024.
//

import SwiftUI
import SwiftData

struct StruggleView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var workouts: [WorkoutItem]
    
    var body: some View {
        Button(action: addWorkout, label: {
            Text("Finish Workout 🏁")
        })
    }
    
    private func addWorkout() {
        withAnimation {
            let newItem = WorkoutItem(title: "GG", date: Date(), time: 0)
            modelContext.insert(newItem)
        }
    }
}

#Preview {
    StruggleView()
}

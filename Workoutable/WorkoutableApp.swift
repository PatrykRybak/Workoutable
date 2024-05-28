//
//  WorkoutableApp.swift
//  Workoutable
//
//  Created by Patryk Rybak on 27/05/2024.
//

import SwiftUI
import SwiftData

@main
struct WorkoutableApp: App {
    @StateObject private var themeManager = ThemeManager()
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
            WorkoutItem.self,
            ExerciseItem.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(themeManager)
        }
        .modelContainer(sharedModelContainer)
    }
}

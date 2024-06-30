//
//  ContentView.swift
//  Workoutable
//
//  Created by Patryk Rybak on 27/05/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            WorkoutsView()
                .tabItem {
                    Image(systemName: "dumbbell")
                    Text("Workout")
                }
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Preferences")
                }
        }.accentColor(.red)
    }
}

#Preview {
    ContentView()
}

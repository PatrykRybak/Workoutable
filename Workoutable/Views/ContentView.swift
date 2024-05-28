//
//  ContentView.swift
//  Workoutable
//
//  Created by Patryk Rybak on 27/05/2024.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var themeManager: ThemeManager
    
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
                    Text("Settings")
                }
        }.accentColor(.red)
//        } .accentColor(themeManager.accentColor)
    }
}

#Preview {
    ContentView()
}

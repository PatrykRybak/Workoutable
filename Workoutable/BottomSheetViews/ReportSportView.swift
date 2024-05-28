//
//  AddExercisesBottomSheetView.swift
//  Workoutable
//
//  Created by Patryk Rybak on 28/05/2024.
//

import SwiftUI

struct ReportSportView: View {
    @ObservedObject var sheetManager: ReportSportManager
    
    var body: some View {
        
        let sports: [(name: String, imageName: String)] = [
            ("Walk", "figure.walk"),
            ("Running", "figure.run"),
            ("Stretching", "figure.strengthtraining.functional"),
            ("Tennis", "figure.tennis"),
            ("Ping-pong", "figure.table.tennis"),
            ("Volleyball", "figure.volleyball"),
            ("Football", "figure.soccer"),
            ("Basketball", "figure.basketball"),
            ("Swimming", "figure.pool.swim"),
            ("Fight", "figure.boxing"),
            ("Cycling", "figure.outdoor.cycle"),
            ("Badminton", "figure.badminton"),
            ("Other activity", "figure.mixed.cardio")
        ]
        
        NavigationView {
                   List {
                       ForEach(sports, id: \.name) { sport in
                           NavigationLink(destination: ReportSportDetailsView(sportName: sport.name, sheetManager: sheetManager)) {
                               CustomLabel(title: sport.name, imageName: sport.imageName)
                           }
                       }
                   }
                   .navigationTitle("Sports 🏁")
               }.navigationViewStyle(StackNavigationViewStyle()).edgesIgnoringSafeArea(.top)
    }
}

struct CustomLabel: View {
    let title: String
    let imageName: String

    var body: some View {
        HStack {
            Image(systemName: imageName)
                .foregroundColor(.red)
                .frame(width: 22, height: 22)
            Text(title)
                .font(.subheadline)
        }
    }
}

#Preview {
    ReportSportView(sheetManager: ReportSportManager())
}

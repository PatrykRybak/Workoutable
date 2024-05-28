//
//  DataAndMock.swift
//  Workoutable
//
//  Created by Patryk Rybak on 28/05/2024.
//

import Combine
import SwiftUI

class ItemViewModel: ObservableObject {
    @Published var workouts: [WorkoutItem] = []

    init(workouts: [WorkoutItem] = []) {
        self.workouts = workouts
    }

    func loadData() {
        // In a real app, you would fetch data from a database or API
        // For preview purposes, we use the sample data
        self.workouts = PreviewData.shared.workouts
    }
}

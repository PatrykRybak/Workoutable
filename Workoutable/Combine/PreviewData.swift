//
//  PreviewData.swift
//  Workoutable
//
//  Created by Patryk Rybak on 28/05/2024.
//

import Foundation

class PreviewData {
    static let shared = PreviewData()

    var workouts: [WorkoutItem] {
        return [
            WorkoutItem(title: "A", date: Date()),
            WorkoutItem(title: "A", date: Date()),
            WorkoutItem(title: "A", date: Date())
        ]
    }
}

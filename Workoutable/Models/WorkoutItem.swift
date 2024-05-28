//
//  WorkoutItem.swift
//  Workoutable
//
//  Created by Patryk Rybak on 27/05/2024.
//

import Foundation
import SwiftData

@Model
final class WorkoutItem {
    var date: Date
    var time: Int
    var title: String
//    var history: ExerciseItem
//    var starred: Bool
    
    init(title: String, date: Date, time: Int) {
        self.date = date
        self.title = title
        self.time = time
    }
}

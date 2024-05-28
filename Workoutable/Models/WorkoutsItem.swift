//
//  WorkoutsItem.swift
//  Workoutable
//
//  Created by Patryk Rybak on 27/05/2024.
//

import Foundation
import SwiftData

@Model
final class WorkoutsItem {
    var date: Date
    var title: String
//    var WorkoutDesc
    
    init(timestamp: Date, title: String) {
        self.date = timestamp
        self.title = title
    }
}

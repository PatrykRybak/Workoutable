//
//  WorkoutRoutineItem.swift
//  Workoutable
//
//  Created by Patryk Rybak on 29/05/2024.
//

import Foundation
import SwiftData

@Model
final class WorkoutRoutineItem {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

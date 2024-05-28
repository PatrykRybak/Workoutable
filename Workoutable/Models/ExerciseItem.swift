//
//  ExerciseItem.swift
//  Workoutable
//
//  Created by Patryk Rybak on 27/05/2024.
//

import Foundation
import SwiftData

@Model
final class ExerciseItem {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

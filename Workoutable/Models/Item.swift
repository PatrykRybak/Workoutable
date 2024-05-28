//
//  Item.swift
//  Workoutable
//
//  Created by Patryk Rybak on 27/05/2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}

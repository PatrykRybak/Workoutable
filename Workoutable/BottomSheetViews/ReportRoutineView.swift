//
//  ReportRoutineView.swift
//  Workoutable
//
//  Created by Patryk Rybak on 24/06/2024.
//

import SwiftUI

struct ReportRoutineView: View {
    @ObservedObject var sheetManager: ReportRoutineManager
    @Binding var showStruggleView: Bool
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {

        Text("Routine Picker")
                    
        Button("Go to StruggleView") {
            presentationMode.wrappedValue.dismiss()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                showStruggleView = true
            }
        }
        
    }
}

#Preview {
    ReportRoutineView(sheetManager: ReportRoutineManager(), showStruggleView: .constant(false))
}

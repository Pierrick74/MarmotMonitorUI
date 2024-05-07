//
//  TextField+.swift
//  MarmotMonitorUI
//
//  Created by pierrick viret on 06/05/2024.
//

import SwiftUI

struct OvalTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(10)
            .cornerRadius(10)
            .tint(Color(uiColor: .label))
            .background( RoundedRectangle(cornerRadius: 20)
                .stroke(Color.black, lineWidth: 1)
                .shadow(color: .gray, radius: 10)
                .background(Color.clear) // Pour rendre le fond transparent
            )

    }
}

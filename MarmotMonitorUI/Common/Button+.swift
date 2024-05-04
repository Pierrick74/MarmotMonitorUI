//
//  Button+.swift
//  MarmotMonitorUI
//
//  Created by pierrick viret on 02/05/2024.
//

import SwiftUI

struct PressableButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
        .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}

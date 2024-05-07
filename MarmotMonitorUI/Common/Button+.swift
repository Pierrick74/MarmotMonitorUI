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
        .font(.custom("Symbol", size: 20))
        .padding(15)
        .foregroundColor(Color(uiColor: .label))
        .background(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color(uiColor: .label), lineWidth: 2) // Crée une bordure noire arrondie
                .background(RoundedRectangle(cornerRadius: 20).fill(Color.clear))
        )
        .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}

struct InactiveButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
        .font(.custom("Symbol", size: 20))
        .padding(15)
        .foregroundColor(Color(.gray))
        .background(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color(.gray), lineWidth: 2) // Crée une bordure noire arrondie
                .background(RoundedRectangle(cornerRadius: 20).fill(Color.clear))
        )
        .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}

struct AdaptableButtonStyle: ButtonStyle {
    @Binding var isActive: Bool

    func makeBody(configuration: Configuration) -> some View {
        Group {
            if isActive {
                PressableButtonStyle().makeBody(configuration: configuration)
            } else {
                InactiveButtonStyle().makeBody(configuration: configuration)
            }
        }
    }
}


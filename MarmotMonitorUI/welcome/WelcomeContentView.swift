//
//  ContentView.swift
//  MarmotMonitorUI
//
//  Created by pierrick viret on 01/05/2024.
//

import SwiftUI
import UIKit

/// This view is used to display the welcome message
/// It is the first view displayed when the app is launched for the first time

struct WelcomeContentView: View {
    @EnvironmentObject var appState: AppStartState

    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(alignment: .trailing) {
                    Spacer()
                        .frame(height: geometry.size.height * 0.20)

                    Image("marmotWithPen")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 120, height: 120)
                        .padding(.bottom, -15)
                        .accessibilityHidden(true)

                    VStack(alignment: .leading) {
                        Text("Bonjour")
                            .font(.custom("Symbol", size: 30))
                            .foregroundColor(Color(uiColor: .label))
                            .padding(.horizontal)
                            .padding(.top)
                            .padding(.bottom, 5)
                        Text("Je vais t'aider à créer ton espace personnalisé")
                            .font(.custom("Symbol", size: 20))
                            .foregroundColor(Color(uiColor: .label))
                            .padding(.horizontal)
                            .padding(.bottom)
                    }
                    .background(.softGrayToEgyptienBlueSoft)
                    .cornerRadius(20)
                    .accessibilityElement(children: .combine)
                    .accessibilityLabel("Bonjour, je vais t'aider à créer ton espace personnalisé")

                    Button(action: {
                        appState.switchView = .babyName
                    }) {
                        Text("Commencer")
                            .font(.custom("Symbol", size: 25))
                            .foregroundColor(Color(uiColor: .label))
                            .padding(15)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.black, lineWidth: 2) // Crée une bordure noire arrondie
                                    .background(RoundedRectangle(cornerRadius: 20).fill(Color.clear))
                            )
                    }
                    .buttonStyle(PressableButtonStyle())
                    .padding(.vertical)
                    .padding(.horizontal, 20)
                    .accessibilityLabel("Commencer")
                    .accessibilityHint("Appuie sur le bouton pour commencer")
                    .accessibilityAddTraits(.isButton)
                }

            }
            .padding()
            .frame(width: geometry.size.width)
        }
        .background(LinearGradient(gradient: Gradient(colors: [Color.pastelBlueToEgyptienBlue, Color.whiteToEgyptienBlue]), startPoint: .top, endPoint: .bottom))
    }
}

#Preview {
    WelcomeContentView()
}

//
//  WelcomeViewManager.swift
//  MarmotMonitorUI
//
//  Created by pierrick viret on 04/05/2024.
//

import SwiftUI

/// This view is used to manage the different views of the app
/// It is used to switch between the different views

struct WelcomeViewManager: View {
    @StateObject var appState = AppStartState()

    let transition: AnyTransition = .asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading))

    var body: some View {
        Group {
            switch appState.switchView {
            case .welcome:
                WelcomeContentView()
                    .environmentObject(appState)
                    .transition(transition)

            case .babyName:
                BabyNameContentView()
                    .environmentObject(appState)
            case .gender:
                GenderContentView()
                    .environmentObject(appState)
            case .parentName:
                ParentNameContentView()
                    .environmentObject(appState)
            case .birthDay:
                WelcomeContentView()
                    .environmentObject(appState)
            case .mainApp:
                WelcomeContentView()
                    .environmentObject(appState)
            }
        }
        .animation(.default, value: appState.switchView)
    }
}

#Preview {
    WelcomeViewManager()
}

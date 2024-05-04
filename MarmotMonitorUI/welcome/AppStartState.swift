//
//  AppStartState.swift
//  MarmotMonitorUI
//
//  Created by pierrick viret on 04/05/2024.
//

import SwiftUI

/// This class is used to manage the different views of the app
/// It is used to switch between the different views
/// The state is stored in the AppStorage
class AppStartState: ObservableObject {
    enum CurrentView: Int {
        case welcome
        case babyName
        case gender
        case parentName
        case birthDay
        case mainApp
    }

    @AppStorage("view") var switchView = CurrentView.welcome

}

//
//  GenderContentView.swift
//  MarmotMonitorUI
//
//  Created by pierrick viret on 09/05/2024.
//

import SwiftUI

struct GenderContentView: View {
    @EnvironmentObject var appState: AppStartState
    @AppStorage("gender") var gender: Gender = .none
    @State var genderStatus : Gender = .none
    @Environment(\.sizeCategory) var sizeCategory
    var isAccessibleCategory: Bool {
        switch sizeCategory {
        case .extraSmall, .small, .medium, .large:
            return false
        default:
            return true
        }
    }

    var shadowColor: Color {
        switch genderStatus {
        case .boy:
            return .blue
        case .girl:
            return .pink
        default:
            return .clear
        }
    }

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
                        Text("La petite marmotte est-elle un garçon ou une fille ?")
                            .font(.custom("Symbol", size: 20))
                            .foregroundColor(Color(uiColor: .label))
                            .padding(.top)
                            .padding(.horizontal)
                            .accessibilityLabel("Quel est le genre de la petite marmotte ?")
                            .accessibilityAddTraits(.isHeader)
                        
                        HStack(alignment: .center) {
                            Spacer()

                            Button(action: {
                                genderStatus = genderStatus == .girl ? .none : .girl
                            }){
                                Image("girl")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: isAccessibleCategory ? 100 : 70,
                                           height: isAccessibleCategory ? 100 : 70)
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(Color.pink, lineWidth: genderStatus == .girl ? 2 : 0))
                            }
                            .accessibilityLabel("Selectionner le genre fille")
                            .accessibilityAddTraits(.isButton)

                            Spacer()
                                .frame(width: 40)

                            Button(action: {
                                genderStatus = genderStatus == .boy ? .none : .boy
                            }){
                                Image("boy")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: isAccessibleCategory ? 100 : 70,
                                           height: isAccessibleCategory ? 100 : 70)
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(Color.blue, lineWidth: genderStatus == .boy ? 2 : 0))
                            }
                            .accessibilityLabel("Selectionner le genre garçon")
                            .accessibilityAddTraits(.isButton)

                            Spacer()
                        }
                        .padding()
                        .padding(.bottom)

                    }
                    .background(.softGrayToEgyptienBlueSoft)
                    .cornerRadius(20)
                    .padding(.horizontal, 10)
                    .shadow(color: shadowColor , radius: 10)

                    Button(action: {
                        gender = genderStatus
                        appState.switchView = .parentName
                    }){
                        Text("Suivant")
                    }
                    .buttonStyle(PressableButtonStyle())
                    .padding(.vertical)
                    .accessibilityLabel("Suivant")
                    .accessibilityHint("Genre selectionné \(genderStatus.description). Appuie pour valider le genre et passer à l'étape suivante")
                    .accessibilityAddTraits(.isButton)
                }

            }
            .padding()
            .frame(width: geometry.size.width)
        }
        .background(LinearGradient(gradient: Gradient(colors: [Color.pastelBlueToEgyptienBlue, Color.whiteToEgyptienBlue]), startPoint: .top, endPoint: .bottom))
        .onAppear(perform: {
            genderStatus = gender
        })
    }
}

#Preview {
    GenderContentView()
}

enum Gender: String {
    case boy, girl, none

    var description: String {
        switch self {
        case .boy:
            return "Garçon"
        case .girl:
            return "Fille"
        case .none:
            return "Aucun"
        }
    }
}

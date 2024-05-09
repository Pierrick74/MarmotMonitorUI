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
                                    
                            }
                            .overlay(Circle().stroke(Color.pink, lineWidth: genderStatus == .girl ? 5 : 0))

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
                                    .overlay(Circle().stroke(Color.blue, lineWidth: genderStatus == .boy ? 5 : 0))
                            }

                            Spacer()
                        }
                        .padding()
                        .padding(.bottom)

                    }
                    .background(.softGrayToEgyptienBlueSoft)
                    .cornerRadius(20)

                    Button(action: {
                        gender = genderStatus
                        print("sauvegarde de \(gender.description)")
                        appState.switchView = .welcome
                    }){
                        Text("Suivant")
                    }
                    .buttonStyle(PressableButtonStyle())
                    .padding(.vertical)
                    .accessibilityLabel("Suivant")
                    .accessibilityHint("Appuie pour valider le genre de l'enfant et passer à l'étape suivante")
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
            return ""
        }
    }
}

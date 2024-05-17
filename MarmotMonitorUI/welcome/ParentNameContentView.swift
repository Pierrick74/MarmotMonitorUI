//
//  ParentNameContentView.swift
//  MarmotMonitorUI
//
//  Created by pierrick viret on 17/05/2024.
//

import SwiftUI

struct ParentNameContentView: View {
    @EnvironmentObject var appState: AppStartState
    @AppStorage("parentName") var parentName = ""
    @FocusState private var isFocused: Bool

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
                        Text("Quel est le nom du parent ?")
                            .font(.custom("Symbol", size: 20))
                            .foregroundColor(Color(uiColor: .label))
                            .padding(.top)
                            .padding(.horizontal)
                            .accessibilityLabel("Quel est le nom du parent ?")
                            .accessibilityAddTraits(.isHeader)

                        TextField("Nom du parent", text: $parentName)
                            .focused($isFocused)
                            .submitLabel(.done)
                            .onSubmit() {
                                appState.switchView = .welcome
                            }
                            .padding()
                            .padding(.bottom)
                            .accessibilityLabel("Nom rentré")
                            .textFieldStyle(OvalTextFieldStyle())
                            .accessibilityValue(parentName)
                            .accessibilityAddTraits(.updatesFrequently)
                            
                    }
                    .background(.softGrayToEgyptienBlueSoft)
                    .cornerRadius(20)

                    Button(action: {
                        appState.switchView = .welcome
                    }){
                        Text("Suivant")
                    }
                    .buttonStyle(PressableButtonStyle())
                    .padding(.vertical)
                    .accessibilityLabel("Suivant")
                    .accessibilityHint("Appuie pour valider le nom du Parent et passer à l'étape suivante")
                    .accessibilityAddTraits(.isButton)
                }

            }
            .padding()
            .frame(width: geometry.size.width)
        }
        .background(LinearGradient(gradient: Gradient(colors: [Color.pastelBlueToEgyptienBlue, Color.whiteToEgyptienBlue]), startPoint: .top, endPoint: .bottom))
        .onTapGesture {
            isFocused = false
        }
    }
}

#Preview {
    ParentNameContentView()
}

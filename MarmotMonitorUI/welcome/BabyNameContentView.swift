//
//  BabyNameContentView.swift
//  MarmotMonitorUI
//
//  Created by pierrick viret on 04/05/2024.
//

import SwiftUI

struct BabyNameContentView: View {
    @EnvironmentObject var appState: AppStartState
    @AppStorage("babyName") var babyName = ""
    @State var isButtonActive: Bool = false
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
                        Text("Quel est le nom de la petite marmotte ?")
                            .font(.custom("Symbol", size: 20))
                            .foregroundColor(Color(uiColor: .label))
                            .padding(.top)
                            .padding(.horizontal)
                            .accessibilityLabel("Quel est le nom de la petite marmotte ?")
                            .accessibilityAddTraits(.isHeader)

                        TextField("Nom du bébé", text: $babyName)
                            .focused($isFocused)
                            .submitLabel(.done)
                            .onSubmit() {
                                if babyName.count > 1 {
                                    appState.switchView = .welcome
                                }
                            }
                            .padding()
                            .padding(.bottom)
                            .accessibilityLabel("Nom rentré")
                            .textFieldStyle(OvalTextFieldStyle())
                            .accessibilityValue(babyName)
                            .accessibilityAddTraits(.updatesFrequently)
                            
                    }
                    .background(.softGrayToEgyptienBlueSoft)
                    .cornerRadius(20)
                    .onChange(of: babyName) {
                        isButtonActive = babyName.count > 1
                    }

                    Button(action: {
                        if babyName.count > 1 {
                            appState.switchView = .gender
                        }
                    }){
                        Text("Suivant")
                    }
                    .buttonStyle(AdaptableButtonStyle(isActive: $isButtonActive))
                    .padding(.vertical)
                    .accessibilityLabel("Suivant")
                    .accessibilityHint("Appuie pour valider le nom de l'enfant et passer à l'étape suivante")
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
    BabyNameContentView()
}

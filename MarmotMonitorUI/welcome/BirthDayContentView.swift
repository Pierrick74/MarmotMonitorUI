//
//  BirthDayContentView.swift
//  MarmotMonitorUI
//
//  Created by pierrick viret on 17/05/2024.
//

import SwiftUI

struct BirthDayContentView: View {
    @EnvironmentObject var appState: AppStartState
    @Environment(\.sizeCategory) var sizeCategory
    
    @AppStorage("birthday") var birthday = ""
    @State private var birthdayDate = Date.now
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(alignment: .trailing) {
                    
                    Spacer().frame(height: geometry.size.height * 0.05)
                       
                    Image("marmotWithPen")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 120, height: 120)
                        .padding(.bottom, -15)
                        .accessibilityHidden(true)

                    VStack(alignment: .leading) {
                        Text("Quel est la date de naissance de la marmotte ?")
                            .font(.custom("Symbol", size: 20))
                            .foregroundColor(Color(uiColor: .label))
                            .padding(.top)
                            .padding(.horizontal)
                            .accessibilityLabel("Quel est la date de naissance de la marmotte?")
                            .accessibilityAddTraits(.isHeader)
                        
                        if sizeCategory.isAccessibilityCategory {
                            DatePicker("Date de naissance", selection: $birthdayDate, displayedComponents: .date)
                                .datePickerStyle(WheelDatePickerStyle())
                                .labelsHidden()
                                .onChange(of: birthdayDate) {
                                    birthday = birthdayDate.formatted(date: .numeric, time: .omitted)
                                }
                        } else {
                            DatePicker("Date de naissance", selection: $birthdayDate, displayedComponents: .date)
                                .datePickerStyle(GraphicalDatePickerStyle())
                                .onChange(of: birthdayDate) {
                                    birthday = birthdayDate.formatted(date: .numeric, time: .omitted)
                                }
                        }
                            
                    }
                    .background(.softGrayToEgyptienBlueSoft)
                    .cornerRadius(20)
                    .onAppear() {
                        birthday = birthdayDate.formatted(date: .numeric, time: .omitted)
                    }

                    Button(action: {
                        appState.switchView = .welcome
                    }){
                        Text("Suivant")
                    }
                    .buttonStyle(PressableButtonStyle())
                    .padding(.vertical)
                    .padding(.trailing, 5)
                    .accessibilityLabel("Suivant")
                    .accessibilityHint("Appuie pour valider la date de naissance et passer à l'étape suivante")
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
    BirthDayContentView()
}

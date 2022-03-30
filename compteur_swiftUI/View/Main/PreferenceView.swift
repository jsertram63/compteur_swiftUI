//
//  PreferenceView.swift
//  compteur_swiftUI
//
//  Created by Pierric Marye on 16/03/2022.
//

import SwiftUI

struct PreferenceView: View {
    
    @EnvironmentObject  private var compteurViewModel: CompteurViewModel
    
    var body: some View {
        
        ZStack {
            Color("Color1").ignoresSafeArea()
            
            VStack {
                // Header
                HStack {
                    Text("Préférences")
                        .font(.system(size: 50, weight: .bold, design: .rounded))
                        .foregroundColor(Color("Color3"))
                    
                    Spacer()
                }
                
                Divider()
                    .background(Color.black)
                    .padding(.bottom)
                //
                VStack(alignment: .leading, spacing: 15.0) {
                    Stepper("incrémentation de: \(compteurViewModel.pasDuCompteur)", value: $compteurViewModel.pasDuCompteur, in: 1...100)
                    
                    Text("Cotégorie: \(compteurViewModel.indexSelectionne)")
                    
                    HStack(alignment: .center) {
                        Text("Choix du thème: ")
                        
                        Image(systemName: "square.fill")
                            .scaledToFit()
                            .scaledToFit()
                            .clipShape(Circle())
                            .foregroundColor(compteurViewModel.arrièrePlan.opacity(compteurViewModel.opaciteSelectionnee))
                            .overlay {
                                Circle().stroke(.white, lineWidth: 3)
                            }
                            .shadow(radius: 2)
                    }
                }
                .font(.body)
                .cornerRadius(15)
                
                Divider()
                    .background(Color.black)
                    .padding(.vertical)
                
                VStack(spacing: 25.0) {
                    Picker("Choisir une catégorie", selection: $compteurViewModel.indexSelectionne) {
                        ForEach(compteurViewModel.intituleCompteur, id: \.self) { index in
                            Text(index)
                                .fontWeight(.medium)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    
                    ColorPicker("Définir votre couleur de fond", selection: $compteurViewModel.arrièrePlan, supportsOpacity: false)
                        .font(.body)
                    
                    Slider(value: $compteurViewModel.opaciteSelectionnee, in: 0...1)
                    
                    Text("Opacité: \((compteurViewModel.opaciteSelectionnee * 100), specifier: "%.f") %")
                        .font(.body)
                        .fontWeight(.bold)
                }
                .padding()
                .background(.ultraThinMaterial)
                .cornerRadius(15)
                .overlay(alignment: .topLeading) {
                    Button {
                        compteurViewModel.arrièrePlan = Color("Color1")
                        compteurViewModel.opaciteSelectionnee = 1.0
                        compteurViewModel.pasDuCompteur = 1
                        compteurViewModel.indexSelectionne = "Posts"
                    } label: {
                        Image(systemName: "arrow.counterclockwise")
                            .frame(width: 15.0, height: 15.0)
                            .font(.headline)
                            .padding(12.0)
                            .foregroundColor(.primary)
                            .background(.thickMaterial)
                            .cornerRadius(15)
                            .shadow(radius: 5)
                    }
                    .padding(12.0)
                }
            }
            .foregroundColor(Color("Color5"))
            .padding()
        }
    }
    
    struct PreferenceView_Previews: PreviewProvider {
        static var previews: some View {
            PreferenceView()
                .environmentObject(CompteurViewModel())
        }
    }
}

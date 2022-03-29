//
//  PreferenceView.swift
//  compteur_swiftUI
//
//  Created by Pierric Marye on 16/03/2022.
//

import SwiftUI

struct PreferenceView: View {
    
    @EnvironmentObject  private var compteurViewModel: CompteurViewModel
    
    // Propriété pour le ColorPickerView
    @State var bgColor = Color("Color5")
    
    // Propriété pour l'opacité
    @State var selectedOpacity: Double = 1.0
    
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
                .padding(.vertical)
                
                Divider()
                    .padding(.bottom)
                //
                VStack(alignment: .leading, spacing: 15.0) {
                    Stepper("incrémentation de: \(compteurViewModel.pasDuCompteur)", value: $compteurViewModel.pasDuCompteur, in: 1...100)
                    
                    Text("Cotégorie: \(compteurViewModel.indexSelectionne)")
                    
                    HStack(alignment: .center) {
                        Text("Choix de la couleur: ")
                        
                        Image(systemName: "square.fill")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(bgColor.opacity(selectedOpacity))
                    }
                }
                .font(.headline)
                .cornerRadius(15)
                
                Divider()
                    .padding(.bottom)
                
                VStack(spacing: 25.0) {
                    Picker("Choisir une catégorie", selection: $compteurViewModel.indexSelectionne) {
                        ForEach(compteurViewModel.intituleCompteur, id: \.self) { index in
                            Text(index)
                                .fontWeight(.medium)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    
                    ColorPicker("Définir votre couleur de fond", selection: $bgColor, supportsOpacity: false)
                        .font(.headline)
                    
                    Slider(value: $selectedOpacity, in: 0...1)
                    
                    Text("Opacité: \((selectedOpacity * 100), specifier: "%.f") %")
                        .font(.headline)
                }
                .padding()
                .background(.ultraThinMaterial)
                .cornerRadius(15)
                .overlay(alignment: .topLeading) {
                    Button {
                        bgColor = Color("Color5")
                        selectedOpacity = 1.0
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
                    .padding(10.0)
                }
            }
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

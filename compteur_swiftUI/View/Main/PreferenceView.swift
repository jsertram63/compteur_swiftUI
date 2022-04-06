//
//  PreferenceView.swift
//  compteur_swiftUI
//
//  Created by Pierric Marye on 16/03/2022.
//

import SwiftUI

struct PreferenceView: View {
    
    @EnvironmentObject  private var compteurViewModel: CompteurViewModel
    
    //@State private var isPresented: Bool = false
    @State private var text: String = ""
    
    var body: some View {
        
        ZStack {
            compteurViewModel.arrierePlan
                .ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 50.0) {
                    header
                    
                    resumeParameter
                    
                    parameters
                    
                }
                .padding()
                .foregroundColor(Color("Color5"))
            }
            // de flouter la view ciblée; ici la scrollView
            .blur(radius: compteurViewModel.alertEstVisible ? 5 : 0)
            
            // modale style alert en arrière plan sera au premier plan sur appui du bouton "Ajouter"
            AlertView(modaleEstVisible: $compteurViewModel.alertEstVisible, text: $text)
        }
    }
    
    struct PreferenceView_Previews: PreviewProvider {
        static var previews: some View {
            PreferenceView()
                .environmentObject(CompteurViewModel())
        }
    }
}

/* ***************************************************************************************** */

extension PreferenceView {
    // Header
    private var header: some View {
        Text("Préférences")
            .font(.system(size: 40, weight: .bold, design: .rounded))
            .foregroundColor(.black)
    }
    
    // ResumeParameter
    private var resumeParameter: some View {
        VStack(alignment: .leading) {
            Stepper("Choix du pas: \(compteurViewModel.pasDuCompteur)", value: $compteurViewModel.pasDuCompteur, in: 1...100)
            
            Text("Cotégorie: \(compteurViewModel.indexSelectionne)")
            
            HStack(alignment: .center) {
                Text("Votre thème: ")
                
                ZStack {
                    Image(systemName: "square.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 25.0, height: 25.0)
                        .clipShape(Rectangle())
                        .foregroundColor(compteurViewModel.arrierePlan)
                }
                .padding(2.0)
                .background(Color.white)
                .clipShape(Rectangle())
                .cornerRadius(5)
            }
        }
        .padding()
        .background(.regularMaterial)
        .cornerRadius(14)
        .shadow(color: .black.opacity(0.5), radius: 5, x: 0, y: 0)
    }
    
    // Parameters
    private var parameters: some View {
        VStack(spacing: 35.0) {
            Picker("Choisir une catégorie", selection: $compteurViewModel.indexSelectionne) {
                ForEach(compteurViewModel.intituleCompteur, id: \.self) { index in
                    Text(index)
                        .fontWeight(.bold)
                }
            }
            .pickerStyle(WheelPickerStyle())
            
            HStack(alignment: .center) {
                Spacer()
                // Bouton ajouter une catégorie par le biais d'une alerte
                Button {
                    withAnimation(.easeInOut) {
                        compteurViewModel.alertEstVisible = true
                    }
                } label: {
                    Text("Ajouter")
                        .foregroundColor(Color.blue)
                }
                .padding(10.0)
                .background(.regularMaterial)
                .cornerRadius(5)
                .shadow(radius: 5)
                
                Spacer()
                
                // Bouton retirer une catégorie par le biais d'une alerte
                Button {
                    
                } label: {
                    Text("Retirer")
                        .foregroundColor(Color.red)
                }
                .padding(10.0)
                .background(.regularMaterial)
                .cornerRadius(5)
                .shadow(radius: 5)
                
                
                Spacer()
            }
            
            ColorPicker("Choisissez votre thème:", selection: $compteurViewModel.arrierePlan, supportsOpacity: true)
                .font(.body)
        }
        .padding(.all)
        .background(.thinMaterial)
        .cornerRadius(15)
        .shadow(color: .black.opacity(0.5), radius: 5, x: 0, y: 0)
        .overlay(alignment: .topLeading) {
            Button {
                // Remise à l'initial des variables
                compteurViewModel.arrierePlan = Color("Color1")
                compteurViewModel.pasDuCompteur = 1
                compteurViewModel.indexSelectionne = "Posts"
            } label: {
                Image(systemName: "arrow.counterclockwise")
                    .frame(width: 15.0, height: 15.0)
                    .font(.headline)
                    .padding(12.0)
                    .foregroundColor(.primary)
                    .background(.regularMaterial)
                    .cornerRadius(15)
                    .shadow(radius: 5)
            }
            .padding(12.0)
        }
    }
}

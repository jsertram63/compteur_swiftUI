//
//  PreferenceView.swift
//  compteur_swiftUI
//
//  Created by Pierric Marye on 16/03/2022.
//

import SwiftUI

struct PreferenceView: View {
    
    @EnvironmentObject var compteurVM: CompteurViewModel
    @EnvironmentObject var preferencesVM: preferencesViewModel
    
    private var colorData = ColorData()
    private var themes: [Color] = [.accentColor, .blue, .indigo, .yellow, .orange, .brown, .red, .purple, .green, .mint, .gray]
    
    @State var alerteAjout = false
    @State var alerteSuppression = false
    
    let screenSize = UIScreen.main.bounds
    
    @State private var text: String = ""
    
    var body: some View {
        
        ZStack {
            compteurVM.arrierePlan
                .ignoresSafeArea()
            
            VStack {
                header
                
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .center, spacing: 35.0) {
                        resumeParameter
                        
                        parameters
                        
                    }
                    .padding()
                }
            }
            // de flouter la view ciblée; ici la scrollView
            .blur(radius: alerteAjout || alerteSuppression ? 10 : 0)
            
            // modale style alert en arrière plan sera au premier plan sur appui du bouton "Ajouter"
            AlertAjoutCategorieView(alerteAjout1: $alerteAjout, text: $text)
            AlertSuppressionCategorieView(alerteSuppression1: $alerteSuppression)
        }
        .onChange(of: compteurVM.arrierePlan) { _ in
            colorData.saveColor(color: compteurVM.arrierePlan)
        }
    }
    
    struct PreferenceView_Previews: PreviewProvider {
        static var previews: some View {
            PreferenceView()
                .environmentObject(CompteurViewModel())
                .environmentObject(preferencesViewModel())
        }
    }
}

/* ***************************************************************************************** */

extension PreferenceView {
    // Header
    private var header: some View {
        HStack {
            Text("Préférences")
                .font(.system(size: 40, weight: .heavy, design: .rounded))
                .foregroundColor(Color.black)
                .padding([.top, .leading])
            
            Spacer()
        }
    }
    
    // ResumeParameter
    private var resumeParameter: some View {
        VStack(alignment: .leading, spacing: 20.0) {
            Stepper("Choix du pas: \(compteurVM.pasDuCompteur)", value: $compteurVM.pasDuCompteur, in: 1...100)
            
            Text("Catégorie: \(compteurVM.intituleCompteur[compteurVM.indexSelectionne])")
            
            HStack(alignment: .center, spacing: 15.0) {
                Text("Votre thème: ")
                
                // Couleur choisie
                ZStack {
                    Image(systemName: "square.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 25.0, height: 25.0)
                        .clipShape(Circle())
                        .foregroundColor(compteurVM.arrierePlan)
                }
                .padding(2.0)
                .background(Color.white)
                .clipShape(Circle())
                .cornerRadius(5)
                .shadow(radius: 3)
            }
        }
        .padding()
        .background(.regularMaterial)
        .cornerRadius(14)
        .shadow(color: .black.opacity(0.5), radius: 5, x: 0, y: 0)
    }
    
    // Parameters
    private var parameters: some View {
        VStack(spacing: 30.0) {
            // PickerView
            Picker("Choisir une catégorie", selection: $compteurVM.indexSelectionne) {
                ForEach(0 ..< compteurVM.intituleCompteur.count, id: \.self) { index in
                    Text(compteurVM.intituleCompteur[index])
                        .fontWeight(.bold)
                }
            }
            .pickerStyle(WheelPickerStyle())
            .frame(width: screenSize.width * 0.5, height: screenSize.height * 0.2)
            
            // Boutons catégories Ajout/Retirer avec animation modale
            HStack(alignment: .center, spacing: 50.0) {
                // Bouton ajouter une catégorie par le biais d'une alerte
                Button {
                    withAnimation(.easeInOut) {
                        alerteAjout = true
                    }
                } label: {
                    Text("Ajouter")
                        .foregroundColor(Color.blue)
                        .padding(10.0)
                        .background(.regularMaterial)
                        .cornerRadius(10)
                        .shadow(radius: 2)
                    
                }
                
                // Bouton retirer une catégorie par le biais d'une alerte
                Button {
                    withAnimation(.easeInOut) {
                        alerteSuppression = true
                    }
                } label: {
                    Text("Retirer")
                        .foregroundColor(Color.red)
                        .padding(10.0)
                        .background(.regularMaterial)
                        .cornerRadius(10)
                        .shadow(radius: 2)
                }
            }
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            // Color Picker personnalisé
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center, spacing: 15.0) {
                    ForEach(themes, id: \.self) { theme in
                        Circle()
                            .foregroundColor(theme)
                            .frame(width: 45, height: 45)
                            .shadow(radius: 3)
                            .onTapGesture {
                                compteurVM.arrierePlan = theme
                            }
                    }
                }
                .padding(.all, 10.0)
                .background(.regularMaterial)
                .cornerRadius(20)
            }
        }
        .padding(.all)
        .background(.regularMaterial)
        .cornerRadius(15)
        .shadow(color: .black.opacity(0.5), radius: 5, x: 0, y: 0)
    }
}

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
    
    @State var alerteAjout = false
    @State var alerteSuppression = false
    
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
                .font(.system(size: 40, weight: .bold, design: .rounded))
                .foregroundColor(compteurVM.arrierePlan == Color.black ? Color.white : Color.black)
                .padding([.top, .leading])
            
            Spacer()
        }
    }
    
    // ResumeParameter
    private var resumeParameter: some View {
        VStack(alignment: .leading, spacing: 20.0) {
            Stepper("Choix du pas: \(compteurVM.pasDuCompteur)", value: $compteurVM.pasDuCompteur, in: 1...100)
            
             Text("Catégorie: \(compteurVM.intituleCompteur[compteurVM.indexSelectionne])") 
            
            HStack(alignment: .center) {
                Text("Votre thème: ")
                
                ZStack {
                    Image(systemName: "square.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 25.0, height: 25.0)
                        .clipShape(Rectangle())
                        .foregroundColor(compteurVM.arrierePlan)
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
        VStack(spacing: 30.0) {
            // PickerView
            Picker("Choisir une catégorie", selection: $compteurVM.indexSelectionne) {
                ForEach(0 ..< preferencesVM.pickerArray.count, id: \.self) { index in
                    Text(compteurVM.intituleCompteur[index])
                        .fontWeight(.bold)
                }
            }
            .pickerStyle(WheelPickerStyle())
            
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
                }
                .padding(10.0)
                .background(.regularMaterial)
                .cornerRadius(5)
                .shadow(radius: 5)
                
                // Bouton retirer une catégorie par le biais d'une alerte
                Button {
                    withAnimation(.easeInOut) {
                        alerteSuppression = true
                    }
                } label: {
                    Text("Retirer")
                        .foregroundColor(Color.red)
                }
                .padding(10.0)
                .background(.regularMaterial)
                .cornerRadius(5)
                .shadow(radius: 5)
            }
            
            // Palette de couleurs
            VStack(spacing: 20.0) {
                Text("Choisissez un thème")
                    .fontWeight(.medium)
                
                HStack(alignment: .center) {
                    Spacer()
                    
                    Image(systemName: "circle.fill")
                        .resizable()
                        .foregroundColor(Color.gray)
                        .clipShape(Circle())
                        .frame(width: 40.0, height: 40.0)
                        .shadow(radius: 5)
                        .onTapGesture {
                            compteurVM.arrierePlan = Color.gray
                        }
                    Spacer()
                    
                    Image(systemName: "circle.fill")
                        .resizable()
                        .foregroundColor(Color("Color2"))
                        .clipShape(Circle())
                        .frame(width: 40.0, height: 40.0)
                        .shadow(radius: 5)
                        .onTapGesture {
                            compteurVM.arrierePlan = Color("Color2")
                        }
                    
                    Spacer()
                    
                    Image(systemName: "circle.fill")
                        .resizable()
                        .foregroundColor(Color("Color3"))
                        .clipShape(Circle())
                        .frame(width: 40.0, height: 40.0)
                        .shadow(radius: 5)
                        .onTapGesture {
                            compteurVM.arrierePlan = Color("Color3")
                        }
                    
                    Spacer()
                    
                    Image(systemName: "circle.fill")
                        .resizable()
                        .foregroundColor(Color.red)
                        .clipShape(Circle())
                        .frame(width: 40.0, height: 40.0)
                        .shadow(radius: 5)
                        .onTapGesture {
                            compteurVM.arrierePlan = Color.red
                        }
                    
                    Spacer()
                }
                
                HStack(alignment: .center) {
                    Spacer()
                    
                    Image(systemName: "circle.fill")
                        .resizable()
                        .foregroundColor(Color.brown)
                        .clipShape(Circle())
                        .frame(width: 40.0, height: 40.0)
                        .shadow(radius: 5)
                        .onTapGesture {
                            compteurVM.arrierePlan = Color.brown
                        }
                    
                    Spacer()
                    
                    Image(systemName: "circle.fill")
                        .resizable()
                        .foregroundColor(Color("Color1"))
                        .clipShape(Circle())
                        .frame(width: 40.0, height: 40.0)
                        .shadow(radius: 5)
                        .onTapGesture {
                            compteurVM.arrierePlan = Color("Color1")
                        }
                    
                    Spacer()
                    
                    Image(systemName: "circle.fill")
                        .resizable()
                        .foregroundColor(Color.purple)
                        .clipShape(Circle())
                        .frame(width: 40.0, height: 40.0)
                        .shadow(radius: 5)
                        .onTapGesture {
                            compteurVM.arrierePlan = Color.purple
                        }
                    
                    Spacer()
                    
                    Image(systemName: "circle.fill")
                        .resizable()
                        .foregroundColor(Color.mint)
                        .clipShape(Circle())
                        .frame(width: 40.0, height: 40.0)
                        .shadow(radius: 5)
                        .onTapGesture {
                            compteurVM.arrierePlan = Color.mint
                        }
                    
                    Spacer()
                }
            }
        }
        .padding(.all)
        .background(.thinMaterial)
        .cornerRadius(15)
        .shadow(color: .black.opacity(0.5), radius: 5, x: 0, y: 0)
    }
}

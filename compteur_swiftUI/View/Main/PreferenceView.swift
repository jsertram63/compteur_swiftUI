//
//  PreferenceView.swift
//  compteur_swiftUI
//
//  Created by Pierric Marye on 16/03/2022.
//

import SwiftUI

struct PreferenceView: View {
    
    @EnvironmentObject  private var compteurVM: CompteurViewModel
    
    //@State private var isPresented: Bool = false
    @State private var text: String = ""
    
    var body: some View {
        
        ZStack {
            compteurVM.arrierePlan
                .ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 50.0) {
                    header
                    
                    resumeParameter
                    
                    parameters
                    
                }
                .padding()
                // de flouter la view ciblée; ici la scrollView
                .blur(radius: compteurVM.modaleAjoutAffichee ? 5 : 0)
            }
            
            // modale style alert en arrière plan sera au premier plan sur appui du bouton "Ajouter"
            AlertView(modaleEstVisible: $compteurVM.modaleAjoutAffichee, text: $text)
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
            Stepper("Choix du pas: \(compteurVM.pasDuCompteur)", value: $compteurVM.pasDuCompteur, in: 1...100)
            
            Text("Cotégorie: \(compteurVM.indexSelectionne)")
            
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
        VStack(spacing: 35.0) {
            // PickerView
            Picker("Choisir une catégorie", selection: $compteurVM.indexSelectionne) {
                ForEach(compteurVM.intituleCompteur, id: \.self) {
                    Text($0)
                        .fontWeight(.bold)
                }
            }
            .pickerStyle(WheelPickerStyle())
            
            // Boutons catégories Ajout/Retirer avec animation modale
            HStack(alignment: .center, spacing: 50.0) {
                // Bouton ajouter une catégorie par le biais d'une alerte
                Button {
                    withAnimation(.easeInOut) {
                        compteurVM.modaleAjoutAffichee = true
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
                
                HStack(alignment: .center, spacing: 15.0) {
                    Image(systemName: "circle.fill")
                        .resizable()
                        .foregroundColor(Color.white)
                        .clipShape(Circle())
                        .frame(width: 50.0, height: 50.0)
                        .shadow(radius: 5)
                        .onTapGesture {
                            compteurVM.arrierePlan = Color.white
                        }
                    Image(systemName: "circle.fill")
                        .resizable()
                        .foregroundColor(Color("Color2"))
                        .clipShape(Circle())
                        .frame(width: 50.0, height: 50.0)
                        .shadow(radius: 5)
                        .onTapGesture {
                            compteurVM.arrierePlan = Color("Color2")
                        }
                    Image(systemName: "circle.fill")
                        .resizable()
                        .foregroundColor(Color("Color3"))
                        .clipShape(Circle())
                        .frame(width: 50.0, height: 50.0)
                        .shadow(radius: 5)
                        .onTapGesture {
                            compteurVM.arrierePlan = Color("Color3")
                        }
                    Image(systemName: "circle.fill")
                        .resizable()
                        .foregroundColor(Color.red)
                        .clipShape(Circle())
                        .frame(width: 50.0, height: 50.0)
                        .shadow(radius: 5)
                        .onTapGesture {
                            compteurVM.arrierePlan = Color.red
                        }
                }
                
                HStack(alignment: .center, spacing: 15.0) {
                    Image(systemName: "circle.fill")
                        .resizable()
                        .foregroundColor(Color.brown)
                        .clipShape(Circle())
                        .frame(width: 50.0, height: 50.0)
                        .shadow(radius: 5)
                        .onTapGesture {
                            compteurVM.arrierePlan = Color.brown
                        }
                    Image(systemName: "circle.fill")
                        .resizable()
                        .foregroundColor(Color("Color1"))
                        .clipShape(Circle())
                        .frame(width: 50.0, height: 50.0)
                        .shadow(radius: 5)
                        .onTapGesture {
                            compteurVM.arrierePlan = Color("Color1")
                        }
                    Image(systemName: "circle.fill")
                        .resizable()
                        .foregroundColor(Color.purple)
                        .clipShape(Circle())
                        .frame(width: 50.0, height: 50.0)
                        .shadow(radius: 5)
                        .onTapGesture {
                            compteurVM.arrierePlan = Color.purple
                        }
                    Image(systemName: "circle.fill")
                        .resizable()
                        .foregroundColor(Color.black)
                        .clipShape(Circle())
                        .frame(width: 50.0, height: 50.0)
                        .shadow(radius: 5)
                        .onTapGesture {
                            compteurVM.arrierePlan = Color.black
                        }
                }
            }
        }
        .padding(.all)
        .background(.thinMaterial)
        .cornerRadius(15)
        .shadow(color: .black.opacity(0.5), radius: 5, x: 0, y: 0)
        .overlay(alignment: .topLeading) {
            Button {
                // Remise à l'initial des variables
                compteurVM.arrierePlan = Color("Color1")
                compteurVM.pasDuCompteur = 1
                compteurVM.indexSelectionne = "Posts"
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

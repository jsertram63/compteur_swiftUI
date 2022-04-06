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
            }
            // de flouter la view ciblée; ici la scrollView
            .blur(radius: compteurViewModel.modaleAffichee ? 5 : 0)
            
            // modale style alert en arrière plan sera au premier plan sur appui du bouton "Ajouter"
            AlertView(modaleEstVisible: $compteurViewModel.modaleAffichee, text: $text)
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
            
            HStack(alignment: .center, spacing: 50.0) {
                // Bouton ajouter une catégorie par le biais d'une alerte
                Button {
                    withAnimation(.easeInOut) {
                        compteurViewModel.modaleAffichee = true
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
                            compteurViewModel.arrierePlan = Color.white
                        }
                    Image(systemName: "circle.fill")
                        .resizable()
                        .foregroundColor(Color("Color2"))
                        .clipShape(Circle())
                        .frame(width: 50.0, height: 50.0)
                        .shadow(radius: 5)
                        .onTapGesture {
                            compteurViewModel.arrierePlan = Color("Color2")
                        }
                    Image(systemName: "circle.fill")
                        .resizable()
                        .foregroundColor(Color("Color3"))
                        .clipShape(Circle())
                        .frame(width: 50.0, height: 50.0)
                        .shadow(radius: 5)
                        .onTapGesture {
                            compteurViewModel.arrierePlan = Color("Color3")
                        }
                    Image(systemName: "circle.fill")
                        .resizable()
                        .foregroundColor(Color.red)
                        .clipShape(Circle())
                        .frame(width: 50.0, height: 50.0)
                        .shadow(radius: 5)
                        .onTapGesture {
                            compteurViewModel.arrierePlan = Color.red
                        }
                    Image(systemName: "circle.fill")
                        .resizable()
                        .foregroundColor(Color.brown)
                        .clipShape(Circle())
                        .frame(width: 50.0, height: 50.0)
                        .shadow(radius: 5)
                        .onTapGesture {
                            compteurViewModel.arrierePlan = Color.brown
                        }
                }
            }
            
            //            ColorPicker("Choisissez votre thème:", selection: $compteurViewModel.arrierePlan, supportsOpacity: true)
            //                .font(.body)
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

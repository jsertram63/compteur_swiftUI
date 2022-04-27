//
//  CompteurView.swift
//  compteur_swiftUI
//
//  Created by Pierric Marye on 16/03/2022.
//

import SwiftUI

struct CompteurView: View {
    
    @EnvironmentObject  private var compteurVM: CompteurViewModel
    
    let screenSize = UIScreen.main.bounds
    
    var body: some View {
        ZStack {
            compteurVM.arrierePlan.ignoresSafeArea()
            
            VStack {
                header
                ScrollView {
                    VStack(alignment: .center, spacing: 60.0) {
                        VStack(alignment: .center, spacing: 15.0) {
                            counter
                            
                            categoriesAndPitch
                        }
                        .frame(width: screenSize.width * 0.75, height: screenSize.height * 0.15)
                        .padding(15.0)
                        .background(.regularMaterial)
                        .cornerRadius(15)
                        .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0, y: 0)
                        
                        usersActions
                    }
                    .padding()
                }
            }
            // de flouter la view ciblée; ici la scrollView
            .blur(radius: compteurVM.alertEstVisible ? 10 : 0)
            // modale style alert en arrière plan sera au premier plan sur appui du bouton "⟲"
            Alert3View(modaleEstVisible3: $compteurVM.alertEstVisible)
        }
//        .onAppear {
//            var intitule: String = DataStore().jsonModel.first?.libelle ?? "valeur non chargé"
//            print("valeur apres chargement : \(intitule)")
//        }
    }
}

struct CompteurView_Previews: PreviewProvider {
    static var previews: some View {
        CompteurView()
            .environmentObject(CompteurViewModel())
    }
}

/* *************************************************************************************** */

extension CompteurView {
    // Header
    private var header: some View {
        HStack {
            Text("Compteur")
                .font(.system(size: 40, weight: .bold, design: .rounded))
                .foregroundColor(compteurVM.arrierePlan == Color.black ? Color.white : Color.black)
                .padding([.top, .leading])
            
            Spacer()
        }
    }
    
    // Counter
    private var counter: some View {
        Text(compteurVM.compteurEnCoursFormatte)
            .font(.system(size: 60, weight: .bold, design: .rounded))
            .foregroundColor(compteurVM.arrierePlan == Color.white ? Color.black : compteurVM.arrierePlan)
    }
    
    // Categories and pitch
    private var categoriesAndPitch: some View {
        HStack(spacing: 5) {
            // Nom du type de choix sera passé à l'avenir
            
             Text("\(compteurVM.intituleCompteur[compteurVM.indexSelectionne]):")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(compteurVM.arrierePlan == Color.white ? Color.black : compteurVM.arrierePlan) 
            
            // Choix du pas d'incrémentation à afficher selon paramètres
            Text("\(compteurVM.pasDuCompteur)")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(compteurVM.arrierePlan == Color.white ? Color.black : compteurVM.arrierePlan)
        }
        .foregroundColor(Color.accentColor)
    }
    
    // Users Actions
    private var usersActions: some View {
        VStack(spacing: 20.0) {
            Spacer()
            
            HStack {
                // Boutons de comptage -
                Button {
                    compteurVM.decCompteur()
                } label: {
                    Image(systemName:"minus.square")
                        .resizable()
                    // change la couleur de l'image
                        .foregroundColor(compteurVM.arrierePlan == Color.white ? Color.black : compteurVM.arrierePlan)
                        .frame(width: 60, height: 60)
                        .padding()
                }
                // Boutons de reset
                Button {
                    // appel des fonctions du compteurViewModel
                    withAnimation(.easeInOut) {
                        compteurVM.alertEstVisible = true
                    }
                } label: {
                    Image(systemName: "arrow.counterclockwise.circle")
                        .resizable()
                    // change la couleur de l'image
                        .foregroundColor(compteurVM.arrierePlan == Color.white ? Color.black : compteurVM.arrierePlan)
                        .frame(width: 60, height: 60)
                        .padding()
                }
                // Boutons de comptage +
                Button {
                    compteurVM.incCompteur()
                } label: {
                    Image(systemName:"plus.square")
                        .resizable()
                    // change la couleur de l'image
                        .foregroundColor(compteurVM.arrierePlan == Color.white ? Color.black : compteurVM.arrierePlan)
                        .frame(width: 60, height: 60)
                        .padding()
                }
            }
            .padding(5.0)
            .background(.regularMaterial)
            .cornerRadius(15)
            
            Spacer()
            // Bouton sauvegarder
            Button(action: {
                // Fonction pour sauvegarder le comptage
            }) {
                Text("Sauvegarder")
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
            }
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            .background(compteurVM.arrierePlan == Color.white ? Color.black : compteurVM.arrierePlan)
            .cornerRadius(15)
            .shadow(color: Color.black.opacity(0.5), radius: 2, x: 2, y: 2)
            
            Spacer()
        }
        .padding()
        .frame(width: screenSize.width * 0.9, height: screenSize.height * 0.4)
        .background(.thinMaterial)
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0, y: 0)
    }
}

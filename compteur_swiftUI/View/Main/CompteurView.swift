//
//  CompteurView.swift
//  compteur_swiftUI
//
//  Created by Pierric Marye on 16/03/2022.
//

import SwiftUI

struct CompteurView: View {
    
    @EnvironmentObject  private var compteurVM: CompteurViewModel
    
    var body: some View {
        // Propriété conteneur en couche ZStack
        ZStack {
            // par exemple la propriété Color est une première couche de la ZStack
            compteurVM.arrierePlan
                .ignoresSafeArea()
            
            // propriété conteneur verticale VStack
            ScrollView {
                VStack(alignment: .leading, spacing: 50.0) {
                    header
                    
                    HStack(alignment: .center) {
                        
                        counter
                        
                        Spacer()
                        
                        categoriesAndPitch
                    }
                    .padding(25.0)
                    .background(.regularMaterial)
                    .cornerRadius(15)
                    .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0, y: 0)
                    
                    Divider()
                        .background(.black)
                    
                    usersActions
                }
                .padding()
            }
        }
    }
}

struct CompteurView_Previews: PreviewProvider {
    static var previews: some View {
        CompteurView()
            .environmentObject(CompteurViewModel())
    }
}

/* ********************************************************************************************** */

extension CompteurView {
    // Header
    private var header: some View {
        Text("Compteur")
            .font(.system(size: 40, weight: .bold, design: .rounded))
            .foregroundColor(compteurVM.arrierePlan == Color.black ? Color.white : Color.black)
    }
    
    // Counter
    private var counter: some View {
        Text(compteurVM.compteurEnCoursFormatte)
            .font(.system(size: 60, weight: .bold, design: .rounded))
            .foregroundColor(compteurVM.arrierePlan == Color.white ? Color.black : compteurVM.arrierePlan)
    }
    
    // Categories and pitch
    private var categoriesAndPitch: some View {
        VStack(spacing: 5) {
            // Nom du type de choix sera passé à l'avenir
            Text(compteurVM.indexSelectionne)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(compteurVM.arrierePlan == Color.white ? Color.black : compteurVM.arrierePlan)
            // Choix du pas d'incrémentation à afficher selon paramètres
            Text("\(compteurVM.pasDuCompteur)")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(compteurVM.arrierePlan == Color.white ? Color.black : compteurVM.arrierePlan)
        }
        .foregroundColor(Color.accentColor)
        .padding()
    }
    
    // Users Actions
    private var usersActions: some View {
        VStack(spacing: 25.0) {
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
                    compteurVM.alertEstVisible = true
                } label: {
                    Image(systemName: "arrow.counterclockwise.circle")
                        .resizable()
                    // change la couleur de l'image
                        .foregroundColor(compteurVM.arrierePlan == Color.white ? Color.black : compteurVM.arrierePlan)
                        .frame(width: 60, height: 60)
                        .padding()
                }
                .alert(isPresented:$compteurVM.alertEstVisible) {
                    Alert(
                        title: Text("Voulez-vous vraiment remettre à zéro le compteur?"),
                        message: Text("Attention, vous perdrez votre dernier comptage !"),
                        primaryButton: .destructive(Text("Annuler")),
                        secondaryButton: .cancel(Text("Oui")) {
                            compteurVM.resetCompteur()
                            compteurVM.compteurEnCours = 0
                        }
                    )
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
            .padding()
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
        .background(.thinMaterial)
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0, y: 0)
    }
}

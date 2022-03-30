//
//  CompteurView.swift
//  compteur_swiftUI
//
//  Created by Pierric Marye on 16/03/2022.
//

import SwiftUI

struct CompteurView: View {
    
    @EnvironmentObject  private var compteurViewModel: CompteurViewModel
    
    var body: some View {
        // Propriété conteneur en couche ZStack
        ZStack {
            // par exemple la propriété Color est une première couche de la ZStack
            compteurViewModel.arrièrePlan
                .opacity(compteurViewModel.opaciteSelectionnee)
                .ignoresSafeArea()
            
            // propriété conteneur verticale VStack
            VStack(spacing: 25.0) {
                header
                
                Divider()
                    .background(Color.black)
                
                counter
                
                Divider()
                    .background(Color.black)
                
                categoriesAndPitch
                
                Divider()
                    .background(Color.black)
                
                usersActions
                
                Spacer()
            }
            .padding()
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
        HStack {
            Text("Compteur")
                .font(.system(size: 40, weight: .bold, design: .rounded))
                .foregroundColor(Color("Color3"))
            
            Spacer()
        }
        .padding(.top)
    }
    
    // Counter
    private var counter: some View {
        HStack{
            // formattage de Int -> String en la propriété déclarée
            Text(compteurViewModel.formattedCompteurEnCours)
                .font(.system(size: 40.0, weight: .bold))
                .foregroundColor(Color("Color5"))
                .padding(.all)
            // ultraThinMaterial : effet de transparence
            //.background(.ultraThinMaterial)
        }
    }
    
    // Categories and pitch
    private var categoriesAndPitch: some View {
        HStack {
            Spacer()
            
            VStack(spacing: 5) {
                // Nom du type de choix sera passé à l'avenir
                Text(compteurViewModel.indexSelectionne)
                    .font(.system(size: 20.0, weight: .bold))
                // Choix du pas d'incrémentation à afficher selon paramètres
                Text("\(compteurViewModel.pasDuCompteur)")
                    .font(.system(size: 20.0, weight: .bold))
            }
        }
        .padding(.trailing)
        .foregroundColor(Color("Color5"))
    }
    
    // Users Actions
    private var usersActions: some View {
        VStack(spacing: 20.0) {
            // Boutons de comptage
            HStack {
                Button {
                    compteurViewModel.decCompteur()
                } label: {
                    Image(systemName:"minus.square")
                        .resizable()
                    // change la couleur de l'image
                        .foregroundColor(Color("Color5"))
                        .frame(width: 50, height: 50)
                        .padding()
                }
                
                Button {
                    // appel des fonctions du compteurViewModel
                    compteurViewModel.alertEstVisible = true
                } label: {
                    Image(systemName: "arrow.counterclockwise.circle")
                        .resizable()
                    // change la couleur de l'image
                        .foregroundColor(Color("Color5"))
                        .frame(width: 50, height: 50)
                        .padding()
                }
                .alert(isPresented:$compteurViewModel.alertEstVisible) {
                    Alert(
                        title: Text("Voulez-vous vraiment remettre à zéro le compteur?"),
                        message: Text("Attention, vous perdrez votre dernier comptage !"),
                        primaryButton: .destructive(Text("Annuler")),
                        secondaryButton: .cancel(Text("Oui")) {
                            compteurViewModel.resetCompteur()
                            compteurViewModel.compteurEnCours = 0
                        }
                    )
                }
                
                Button {
                    compteurViewModel.incCompteur()
                } label: {
                    Image(systemName:"plus.square")
                        .resizable()
                    // change la couleur de l'image
                        .foregroundColor(Color("Color5"))
                        .frame(width: 50, height: 50)
                        .padding()
                }
            }
            // Bouton sauvegarder
            Button(action: {
                // Fonction pour sauvegarder le comptage
            }) {
                Text("Sauvegarder")
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
            }
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            .background(Color("Color2"))
            .cornerRadius(15)
            .shadow(color: Color.black.opacity(0.5), radius: 2, x: 2, y: 2)
        }
        .padding()
        .background(.thinMaterial)
        .cornerRadius(15)
    }
}

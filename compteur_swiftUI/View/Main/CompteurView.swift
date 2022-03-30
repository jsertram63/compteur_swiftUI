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
            VStack {
                NavigationBarView()
                
                Divider()
                    .background(Color.black)
                    .padding(.horizontal)
                
                HeaderView()
                
                Divider()
                    .background(Color.black)
                    .padding(.horizontal)
                
                ParametersView()
                
                Divider()
                    .background(Color.black)
                    .padding(.horizontal)
                
                ButtonsView()
                    .padding()
                
                Spacer()
                
                saveButton
                
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

/* ******************************************************* ******** */

extension CompteurView {
    // Bouton sauvegarder
    private var saveButton: some View {
        Button(action: {
            // Fonction pour sauvegarder le comptage
        }) {
            Text("Sauvegarder")
                .fontWeight(.bold)
                .foregroundColor(Color("Color5"))
        }
        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        .background(Color("Color2"))
        .clipShape(Capsule())
        .shadow(color: Color.black.opacity(0.5), radius: 5, x: 2, y: 3)
    }
}

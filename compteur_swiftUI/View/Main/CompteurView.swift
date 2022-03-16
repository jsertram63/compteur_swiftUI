//
//  CompteurView.swift
//  compteur_swiftUI
//
//  Created by Pierric Marye on 16/03/2022.
//

import SwiftUI

struct CompteurView: View {
    
    var body: some View {
        // Propriété conteneur en couche ZStack
        ZStack {
            
            Color.blue.ignoresSafeArea()
            
            // propriété conteneur verticale VStack
            VStack {
                
                HeaderView()
                
                Spacer()
                
                Divider()
                    .padding()
                
                ParametersView()
                
                Divider()
                    .padding()
                
                ButtonsView()
                
                Spacer()
                
                Button(action: {
                    // Fonction pour sauvegarder le comptage
                }) {
                    Text("Sauvegarder")
                }
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .background(.green)
                .clipShape(Capsule())
                .shadow(color: Color.black.opacity(0.5), radius: 5, x: 5, y: 5)
                
                Spacer()
            }
            .foregroundColor(.white) // accenColor défini dans Assets
            .padding()
        }
    }
}

struct CompteurView_Previews: PreviewProvider {
    static var previews: some View {
        CompteurView()
    }
}

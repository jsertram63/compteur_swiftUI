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
            
            Color("Color1").ignoresSafeArea()
            
            // propriété conteneur verticale VStack
            VStack {
                NavigationBarView()
                
                Divider()
                
                HeaderView()
                
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
                        .fontWeight(.bold)
                }
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .background(Color("Color2"))
                .clipShape(Capsule())
                .shadow(color: Color.black.opacity(0.5), radius: 5, x: 2, y: 3)
                
                Spacer()
            }
            .padding()
        }
    }
}

struct CompteurView_Previews: PreviewProvider {
    static var previews: some View {
        CompteurView()
    }
}

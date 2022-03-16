//
//  ButtonsView.swift
//  compteur_swiftUI
//
//  Created by Lunack on 14/03/2022.
//

import SwiftUI

struct ButtonsView: View {
    var body: some View {
        HStack {
            
            Spacer()
            
            Button {
                // Action pour soustraire l'incrémentation
            } label: {
                Image(systemName:"minus.square")
                    .resizable()
                    // change la couleur de l'image
                    .foregroundColor(Color("Color5"))
                    .frame(width: 75, height: 75)
                    .padding()
            }

            
            Spacer()
            
            Button {
                // Action pour mettre à zéro le compteur
            } label: {
                Image(systemName: "arrow.counterclockwise.circle")
                    .resizable()
                    // change la couleur de l'image
                    .foregroundColor(Color("Color5"))
                    .frame(width: 75, height: 75)
                    .padding()
            }

            
            Spacer()
            
            Button {
                // Action pour ajouter l'incrémentation
            } label: {
                Image(systemName:"plus.square")
                    .resizable()
                    // change la couleur de l'image
                    .foregroundColor(Color("Color5"))
                    .frame(width: 75, height: 75)
                    .padding()
            }

            
            Spacer()
        }
        .background(.ultraThinMaterial)
        .cornerRadius(25)
    }
}

struct ButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsView()
    }
}

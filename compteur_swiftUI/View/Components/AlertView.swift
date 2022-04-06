//
//  AlertView.swift
//  compteur_swiftUI
//
//  Created by Pierric Marye on 06/04/2022.
//

import SwiftUI

struct AlertView: View {
    let screenSize = UIScreen.main.bounds
    @Binding var isShown: Bool
    @Binding var text: String
    
    var body: some View {
        VStack(spacing: 25.0) {
            Text("Ajouter une catégorie")
                .fontWeight(.medium)
            
            TextField("", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            HStack {
                Spacer()
                
                Button {
                    // change la variable d'état pour enlever la modale
                    isShown = false
                    // Ajouter une fonction d'ajout d'une catégorie au picker en plus
                } label: {
                    Text("Valider")
                        .foregroundColor(.blue)
                        .padding(10.0)
                        .background(.white)
                        .cornerRadius(10)
                        .shadow(radius: 2)
                }
                
                Spacer()
                
                Button {
                    // change la variable d'état pour enlever la modale
                    isShown = false
                } label: {
                    Text("Annuler")
                        .foregroundColor(.red)
                        .padding(10.0)
                        .background(.white)
                        .cornerRadius(10)
                        .shadow(radius: 3)
                }
                
                Spacer()
            }
        }
        .padding()
        .frame(width: screenSize.width * 0.7, height: screenSize.height * 0.3)
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 20.0, style: .continuous))
        .offset(x: isShown ? 0 : screenSize.width, y: isShown ? 0 : screenSize.height)
        .shadow(color: .black.opacity(0.5), radius: 2, x: 0, y: 0)
    }
}

struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        AlertView(isShown: .constant(true), text: .constant(""))
    }
}

//
//  AlertView.swift
//  compteur_swiftUI
//
//  Created by Pierric Marye on 06/04/2022.
//

import SwiftUI

struct AlertAjoutCategorieView: View {
    
    @EnvironmentObject var compteurVM: CompteurViewModel
    
    let screenSize = UIScreen.main.bounds
    @Binding var alerteAjout1: Bool
    
    @Binding var text: String
    
    var body: some View {
        VStack(spacing: 25.0) {
            Text("Ajouter une catégorie")
                .fontWeight(.bold)
            
            TextField("", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            HStack {
                Spacer()
                
                Button {
                    // change la variable d'état pour enlever la modale
                    withAnimation(.easeInOut) {
                        alerteAjout1 = false
                    }
                    // Une fonction d'ajout d'une catégorie au picker en plus
                    compteurVM.intituleCompteur.append(text)
                    text = ""
                    cacherClavier()
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
                    withAnimation(.easeInOut) {
                        alerteAjout1 = false
                    }
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
        .frame(width: screenSize.width * 0.8, height: screenSize.height * 0.3)
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 20.0, style: .continuous))
        .shadow(color: .black.opacity(0.5), radius: 2, x: 0, y: 0)
        .offset(x: alerteAjout1 ? 0 : screenSize.width, y: alerteAjout1 ? 0 : screenSize.height)
    }
}

struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        AlertAjoutCategorieView(alerteAjout1: .constant(true), text: .constant(""))
    }
}

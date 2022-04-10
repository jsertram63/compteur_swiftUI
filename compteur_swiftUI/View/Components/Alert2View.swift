//
//  Alert2View.swift
//  compteur_swiftUI
//
//  Created by Pierric Marye on 10/04/2022.
//

import SwiftUI

struct Alert2View: View {
    
    @EnvironmentObject var compteurVM: CompteurViewModel
    
    let screenSize = UIScreen.main.bounds
    @Binding var modaleEstVisible2: Bool
    
    var body: some View {
        VStack(spacing: 25.0) {
            Text("Voulez-vous vraiment supprimer cette catégorie ?")
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
            
            HStack {
                Spacer()
                
                Button {
                    // change la variable d'état pour enlever la modale
                    withAnimation(.easeInOut) {
                        modaleEstVisible2 = false
                    }
                    compteurVM.intituleCompteur.remove(at: compteurVM.indexSelectionne)
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
                        modaleEstVisible2 = false
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
        .offset(x: modaleEstVisible2 ? 0 : screenSize.width, y: modaleEstVisible2 ? 0 : screenSize.height)
        .shadow(color: .black.opacity(0.5), radius: 2, x: 0, y: 0)
    }
}

struct Alert2View_Previews: PreviewProvider {
    static var previews: some View {
        Alert2View(modaleEstVisible2: .constant(true))
    }
}

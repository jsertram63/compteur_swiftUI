//
//  Alert3View.swift
//  compteur_swiftUI
//
//  Created by Pierric Marye on 12/04/2022.
//

import SwiftUI

struct AlertResetCompteurView: View {
    
    @EnvironmentObject var compteurVM: CompteurViewModel
    
    let screenSize = UIScreen.main.bounds
    @Binding var resetAlerte1: Bool
    
    var body: some View {
        VStack(spacing: 25.0) {
            VStack(spacing: 15.0) {
                Text("Voulez-vous vraiment réinitialiser le compteur ?")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                Text("Attention, vous perdrez votre dernier comptage !")
                    .multilineTextAlignment(.center)
            }
            
            HStack {
                Spacer()
                
                Button {
                    // change la variable d'état pour enlever la modale
                    withAnimation(.easeInOut) {
                        resetAlerte1 = false
                    }
                    compteurVM.resetCompteur()
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
                        resetAlerte1 = false
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
        .offset(x: resetAlerte1 ? 0 : screenSize.width, y: resetAlerte1 ? 0 : screenSize.height)
    }
}

struct Alert3View_Previews: PreviewProvider {
    static var previews: some View {
        AlertResetCompteurView(resetAlerte1: .constant(true))
    }
}

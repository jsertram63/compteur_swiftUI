//
//  Alert3View.swift
//  compteur_swiftUI
//
//  Created by Pierric Marye on 12/04/2022.
//

import SwiftUI

struct Alert3View: View {
    
    @EnvironmentObject var compteurVM: CompteurViewModel
    
    let screenSize = UIScreen.main.bounds
    @Binding var modaleEstVisible3: Bool
    
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
                        modaleEstVisible3 = false
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
                        modaleEstVisible3 = false
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
        .offset(x: modaleEstVisible3 ? 0 : screenSize.width, y: modaleEstVisible3 ? 0 : screenSize.height)
        .shadow(color: .black.opacity(0.5), radius: 2, x: 0, y: 0)
    }
}

struct Alert3View_Previews: PreviewProvider {
    static var previews: some View {
        Alert3View(modaleEstVisible3: .constant(true))
    }
}
//
//  ButtonsView.swift
//  compteur_swiftUI
//
//  Created by Lunack on 14/03/2022.
//

import SwiftUI

struct ButtonsView: View {
    
    @EnvironmentObject  private var compteurViewModel: CompteurViewModel
    
    var body: some View {
        HStack {
            
            Spacer()
            
            Button {
                compteurViewModel.decCompteur()
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
                // appel des fonctions du compteurViewModel
                compteurViewModel.alertEstVisible.toggle()
                
                //compteurViewModel.resetCompteur()
            } label: {
                Image(systemName: "arrow.counterclockwise.circle")
                    .resizable()
                    // change la couleur de l'image
                    .foregroundColor(Color("Color5"))
                    .frame(width: 75, height: 75)
                    .padding()
            }
            .alert(isPresented: $compteurViewModel.alertEstVisible, content: {
            
                return Alert(title: Text("Remise à zero"), message: Text("Voulez vous remettre à zero"), dismissButton: .default(Text("Oui"), action: {
                    compteurViewModel.resetCompteur()
                }))
            })

            
            Spacer()
            
            Button {
                compteurViewModel.incCompteur()
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

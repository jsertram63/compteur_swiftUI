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
            
            minusButton
            
            Spacer()
            
            resetButton
            
            Spacer()
            
            plusButton
            
            Spacer()
        }
        .background(.ultraThinMaterial)
        .cornerRadius(25)
    }
}

struct ButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        // Coloration du fond de la preview afin de mieux visualiser
        ZStack {
            Color.accentColor.ignoresSafeArea()
            ButtonsView()
                .environmentObject(CompteurViewModel())
        }
    }
}

/* ************************************************************************** */

extension ButtonsView {
    // Vue bouton décrémentation
    private var minusButton: some View {
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
    }
    
    // Vue bouton reset
    private var resetButton: some View {
        Button {
            // appel des fonctions du compteurViewModel
            compteurViewModel.alertEstVisible = true
        } label: {
            Image(systemName: "arrow.counterclockwise.circle")
                .resizable()
            // change la couleur de l'image
                .foregroundColor(Color("Color5"))
                .frame(width: 75, height: 75)
                .padding()
        }
        .alert(isPresented:$compteurViewModel.alertEstVisible) {
            Alert(
                title: Text("Voulez-vous vraiment remettre à zéro le compteur?"),
                message: Text("Attention, vous perdrez le votre dernier comptage !"),
                primaryButton: .destructive(Text("Oui")) {
                    compteurViewModel.resetCompteur()
                    compteurViewModel.compteurEnCours = 0000
                },
                secondaryButton: .cancel(Text("Annuler"))
            )
        }
    }
    
    // Vue bouton d'incrémentation
    private var plusButton: some View {
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
    }
}

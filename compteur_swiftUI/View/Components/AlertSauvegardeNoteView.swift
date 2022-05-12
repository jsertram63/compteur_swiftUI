//
//  AlertSauvegardeNoteView.swift
//  compteur_swiftUI
//
//  Created by Pierric Marye on 10/05/2022.
//

import SwiftUI

struct AlertSauvegardeNoteView: View {
    @EnvironmentObject var compteurVM: CompteurViewModel
    
    let screenSize = UIScreen.main.bounds
    @Binding var alerteAjout2: Bool
    
    @Binding var note: String
    
    var body: some View {
        VStack(spacing: 25.0) {
            Text("Ajouter une note à votre enregistrement.")
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            
            TextEditor(text: $note)
                .frame(height: 75.0)
                .cornerRadius(5)
            
            HStack {
                Spacer()
                
                Button {
                    // change la variable d'état pour enlever la modale
                    withAnimation(.easeInOut) {
                        alerteAjout2 = false
                    }
                    cacherClavier()
                    // Ajoute à la liste des historiques le résultat du comptage
                    compteurVM.ajoutHistorique(
                        compteur: compteurVM.compteurEnCoursFormatte,
                        categorie: compteurVM.intituleCompteur[compteurVM.indexSelectionne],
                        pasCompteur: compteurVM.pasDuCompteur,
                        date: compteurVM.dateFormatee,
                        note: note
                        )
                    note = ""
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
                        alerteAjout2 = false
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
        .offset(x: alerteAjout2 ? 0 : screenSize.width, y: alerteAjout2 ? 0 : screenSize.height)
    }
}

struct AlertSauvegardeNoteView_Previews: PreviewProvider {
    static var previews: some View {
        AlertSauvegardeNoteView(alerteAjout2: .constant(true), note: .constant(""))
    }
}

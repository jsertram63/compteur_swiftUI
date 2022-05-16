//
//  Alert2View.swift
//  compteur_swiftUI
//
//  Created by Pierric Marye on 10/04/2022.
//

import SwiftUI

struct AlertSuppressionCategorieView: View {
    
    @EnvironmentObject var compteurVM: CompteurViewModel
    @EnvironmentObject var preferencesVM: preferencesViewModel
    
    let screenSize = UIScreen.main.bounds
    @Binding var alerteSuppression1: Bool
    
    var body: some View {
        VStack(spacing: 25.0) {
            Text("Voulez-vous vraiment supprimer cette catégorie ?")
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            
            HStack {
                Spacer()
                
                Button {
                    // change la variable d'état pour enlever la modale
                    withAnimation(.easeInOut) {
                        alerteSuppression1 = false
                    }
                   compteurVM.removeElementOfPicker(indexSel:compteurVM.indexSelectionne)
                    
                    print("BOUTON SUPPRESSION")
                    print(compteurVM.intituleCompteur)
                    /*preferencesVM.pickerArray.removeAll { $0.id == preferencesVM.pickerArray
                        
                    }*/
                    //compteurVM.intituleCompteur.remove(at: compteurVM.indexSelectionne)
                    print("APRES SUPPRESSION")
                    print(compteurVM.intituleCompteur)
                    preferencesVM.pickerArray.removeAll()
                    compteurVM.intituleCompteur.forEach { libelle  in
                        preferencesVM.pickerArray.append(PreferencesModel(id: UUID(), picker: libelle))
                    }
                    preferencesVM.writeJSON()
                   // compteurVM.intituleCompteur.remove(at: compteurVM.indexSelectionne)
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
                        alerteSuppression1 = false
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
        .offset(x: alerteSuppression1 ? 0 : screenSize.width, y: alerteSuppression1 ? 0 : screenSize.height)
    }

}

struct Alert2View_Previews: PreviewProvider {
    static var previews: some View {
        AlertSuppressionCategorieView(alerteSuppression1: .constant(true))
    }
}

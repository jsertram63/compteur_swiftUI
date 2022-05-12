//
//  listeHistoriqueView.swift
//  compteur_swiftUI
//
//  Created by Pierric Marye on 04/05/2022.
//

import SwiftUI

struct listeHistoriqueView: View {
    @EnvironmentObject private var compteurVM: CompteurViewModel
    
    let historique: HistoriqueModel
    
    let screenSize = UIScreen.main.bounds
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5.0) {
            HStack {
                Spacer()
                
                Text(historique.date)
                    .fontWeight(.medium)
            }
            
            HStack {
                Text(historique.categorie)
                    .font(.headline)
                    .fontWeight(.bold)
                
                Text(historique.compteur)
                    .font(.headline)
                    .fontWeight(.medium)
            }
            
            Text(historique.note)
        }
    }
    
    struct listeHistoriqueView_Previews: PreviewProvider {
        static var previews: some View {
            ZStack {
                Color.accentColor.ignoresSafeArea()
                listeHistoriqueView(
                    historique:
                        HistoriqueModel(
                            categorie: "Migration oiseaux",
                            compteur: "0352",
                            pasCompteur: 10,
                            date: "12/05/2022 15:45",
                            note: "Nombres d'Hirondelles comptées lors de la migration printemps 2022. Comptage effectué dans la réserve naturelle de Py (66)"
                        )
                )
                .padding()
                .background(.regularMaterial)
            }
        }
    }
}

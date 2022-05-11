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
        VStack(alignment: .leading, spacing: 10.0) {
            HStack {
                Text(historique.date)
                    .font(.headline)
                    .fontWeight(.medium)
                
                Spacer()
            }
            
            HStack(alignment: .top, spacing: 25.0) {
                VStack(alignment: .leading, spacing: 5.0) {
                    Text(historique.categorie)
                        .font(.title3)
                        .fontWeight(.bold)
                    
                    Text(historique.compteur)
                        .font(.headline)
                        .fontWeight(.medium)
                }
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text(historique.note)
                }
                .frame(width: screenSize.width * 0.50)
            }
        }
    }
}

struct listeHistoriqueView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.accentColor.ignoresSafeArea()
            listeHistoriqueView(
                historique:
                    HistoriqueModel(
                        categorie: "Heures codage",
                        compteur: "0100",
                        pasCompteur: 1,
                        date: "06/05/2022 à 16:25",
                        note: "Nombres de votes obtenus lors des derniers comptages."
                    )
            )
            .padding()
            .background(.regularMaterial)
        }
    }
}

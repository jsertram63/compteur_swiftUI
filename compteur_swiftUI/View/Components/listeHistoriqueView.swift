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
        HStack(alignment: .center) {
            VStack(alignment: .leading, spacing: 10.0) {
                Text(historique.date)
                    .font(.headline)
                    .fontWeight(.medium)
                
                Text("Commentaire")
            }
            
            Spacer()
            
            VStack(alignment: .center, spacing: 10.0) {
                Text(historique.categorie)
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text(historique.compteur)
                    .font(.title3)
                    .fontWeight(.medium)
            }
        }
    }
}

struct listeHistoriqueView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.accentColor.ignoresSafeArea()
            listeHistoriqueView(historique: HistoriqueModel(categorie: "Votes", compteur: "0005", pasCompteur: 1, date: "06/05/2022 à 16h25"))
                .padding()
                .background(.regularMaterial)
        }
    }
}

//
//  listeHistoriqueView.swift
//  compteur_swiftUI
//
//  Created by Pierric Marye on 04/05/2022.
//

import SwiftUI

struct listeHistoriqueView: View {
    
    let historique: HistoriqueModel
    
    let screenSize = UIScreen.main.bounds
    
    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .center, spacing: 10.0) {
                Text(historique.date)
                    .font(.headline)
                    .fontWeight(.medium)
                
                Text(historique.categorie)
                    .font(.title2)
                    .fontWeight(.bold)
            }
            
            Spacer()
            
            VStack(alignment: .center, spacing: 10.0) {
                Text(historique.compteur)
                    .font(.title3)
                    .fontWeight(.medium)
                
                Text("\(historique.pasCompteur)")
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
            listeHistoriqueView(historique: HistoriqueModel(categorie: "Votes", compteur: "0000", pasCompteur: 1, date: "06/05/2022 à 16h25"))
                .padding()
                .background(.regularMaterial)
        }
    }
}

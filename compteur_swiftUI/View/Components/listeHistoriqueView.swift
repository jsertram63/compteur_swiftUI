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
            Text(historique.categorie)
                .font(.title)
                .fontWeight(.bold)
            
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
        .frame(width: screenSize.width * 0.85, height: screenSize.height * 0.10)
        .padding(15.0)
        .background(.regularMaterial)
        .cornerRadius(15)
    }
}

struct listeHistoriqueView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.accentColor.ignoresSafeArea()
            listeHistoriqueView(historique: HistoriqueModel(categorie: "Votes", compteur: "0000", pasCompteur: 1))
        }
    }
}

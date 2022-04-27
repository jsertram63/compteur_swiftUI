//
//  historiqueView.swift
//  compteur_swiftUI
//
//  Created by Pierric Marye on 16/03/2022.
//

import SwiftUI

struct HistoriqueView: View {
    
    @EnvironmentObject private var compteurViewModel: CompteurViewModel
    
    let screenSize = UIScreen.main.bounds
    
    
    var body: some View {
        
        ZStack {
            compteurViewModel.arrierePlan
                .ignoresSafeArea()
            
            VStack {
                if compteurViewModel.historique.isEmpty {
                    HStack {
                        Text("Votre liste d'historique est vide")
                    }
                    .frame(width: screenSize.width * 0.75, height: screenSize.height * 0.15)
                    .padding(15.0)
                    .background(.regularMaterial)
                    .cornerRadius(15)
                    .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0, y: 0)
                } else {
                    ScrollView {
                        ForEach(compteurViewModel.historique) { item in
                            VStack {
                                //
                            }
                            .onTapGesture {
                                withAnimation(.linear) {
                                    compteurViewModel.miseAJourHistorique(item: item)
                                }
                            }
                        }
                        .onDelete(perform: compteurViewModel.suppHistorique)
                        .onMove(perform: compteurViewModel.deplacerHistorique)
                    }
                }
            }
        }
    }
}

struct historiqueView_Previews: PreviewProvider {
    static var previews: some View {
        HistoriqueView()
            .environmentObject(CompteurViewModel())
    }
}

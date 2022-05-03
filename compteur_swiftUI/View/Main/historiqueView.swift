//
//  historiqueView.swift
//  compteur_swiftUI
//
//  Created by Pierric Marye on 16/03/2022.
//

import SwiftUI

struct HistoriqueView: View {
    
    @EnvironmentObject private var compteurVM: CompteurViewModel
    
    let screenSize = UIScreen.main.bounds
    
    var body: some View {
        
        ZStack {
            compteurVM.arrierePlan
                .ignoresSafeArea()
            
            VStack {
                if compteurVM.historique.isEmpty {
                    header
                    
                    listeVide
                    
                    Spacer()
                } else {
                    VStack {
                        header
                        
                        ScrollView(showsIndicators: false) {
                            ForEach(compteurVM.historique) { item in
                                HStack(alignment: .center) {
                                    Text(compteurVM.intituleCompteur[compteurVM.indexSelectionne])
                                        .font(.title)
                                        .fontWeight(.bold)
                                    
                                    Spacer()
                                    
                                    VStack(alignment: .center, spacing: 10.0) {
                                        Text(compteurVM.compteurEnCoursFormatte)
                                            .font(.title3)
                                            .fontWeight(.medium)
                                        
                                        Text("\(compteurVM.pasDuCompteur)")
                                            .font(.title3)
                                            .fontWeight(.medium)
                                    }
                                }
                                .padding(15.0)
                                .background(.regularMaterial)
                                .cornerRadius(15)
                                //                                .onTapGesture {
                                //                                    withAnimation(.linear) {
                                //                                        compteurVM.miseAJourHistorique(item: item)
                                //                                    }
                                //                                }
                            }
                            .onDelete(perform: compteurVM.suppHistorique)
                            .onMove(perform: compteurVM.deplacerHistorique)
                        }
                        .padding()
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

/* *************************************************************************************** */

extension HistoriqueView {
    // Header
    private var header: some View {
        HStack {
            Text("Historique")
                .font(.system(size: 40, weight: .bold, design: .rounded))
                .foregroundColor(compteurVM.arrierePlan == Color.black ? Color.white : Color.black)
                .padding([.top, .leading])
            
            Spacer()
        }
    }
    
    // Liste vide
    private var listeVide: some View {
        HStack {
            Text("Votre liste d'historique est vide")
        }
        .frame(width: screenSize.width * 0.75, height: screenSize.height * 0.15)
        .padding(15.0)
        .background(.regularMaterial)
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0, y: 0)
    }
}

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
                    header
                    
                    List {
                        ForEach(compteurVM.historique) { item in
                            listeHistoriqueView(historique: item)
                                .onAppear {
                                    withAnimation(.linear) {
                                        compteurVM.miseAJourHistorique(item: item)
                                    }
                                }
                        }
                        .onDelete(perform: compteurVM.suppHistorique)
                        .onMove(perform: compteurVM.deplacerHistorique)
                    }
                    .listRowBackground(.none)
                    .listStyle(PlainListStyle())
                    .toolbar {
                        EditButton()
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
        HStack(alignment: .center) {
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
        .frame(width: screenSize.width * 0.85, height: screenSize.height * 0.10)
        .background(.regularMaterial)
        .cornerRadius(15)
    }
}

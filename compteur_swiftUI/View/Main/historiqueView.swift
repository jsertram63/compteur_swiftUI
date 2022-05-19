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
                header
                
                if compteurVM.historique.isEmpty {
                    // Liste vide
                    HStack {
                        Text("Votre liste d'historique est vide")
                            .fontWeight(.heavy)
                            .foregroundColor(compteurVM.arrierePlan)
                    }
                    .frame(width: screenSize.width * 0.90, height: screenSize.height * 0.10)
                    .background(.regularMaterial)
                    .cornerRadius(15)
                    .shadow(color: .black.opacity(0.5), radius: 5, x: 0, y: 0)
                    
                    Spacer()
                } else {
                    List {
                        ForEach(compteurVM.historique) { item in
                            listeHistoriqueView(historique: item)
                                .foregroundColor(compteurVM.arrierePlan)
                                .onAppear {
                                    withAnimation(.linear) {
                                        compteurVM.miseAJourHistorique(item: item)
                                    }
                                }
                                .foregroundColor(compteurVM.arrierePlan)
                        }
                        .onDelete(perform: compteurVM.suppHistorique)
                    }
                    .listStyle(PlainListStyle())
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
                .font(.system(size: 40, weight: .heavy, design: .rounded))
                .padding([.top, .leading])
            
            Spacer()
        }
    }
}

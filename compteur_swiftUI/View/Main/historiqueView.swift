//
//  historiqueView.swift
//  compteur_swiftUI
//
//  Created by Pierric Marye on 16/03/2022.
//

import SwiftUI

struct historiqueView: View {
    
    @EnvironmentObject  private var compteurViewModel: CompteurViewModel
    
    var body: some View {
        
        ZStack {
            compteurViewModel.arrièrePlan
                .opacity(compteurViewModel.opaciteSelectionnee)
                .ignoresSafeArea()
            
            VStack {
                Text("Historique")
            }
            .foregroundColor(Color("Color5"))
        }
    }
}

struct historiqueView_Previews: PreviewProvider {
    static var previews: some View {
        historiqueView()
            .environmentObject(CompteurViewModel())
    }
}

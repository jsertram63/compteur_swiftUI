//
//  CreditsView.swift
//  compteur_swiftUI
//
//  Created by Pierric Marye on 05/05/2022.
//

import SwiftUI

struct CreditsView: View {
    
    @EnvironmentObject var compteurVM: CompteurViewModel
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 25.0) {
                Image("icon")
                    .resizable()
                    .frame(width: 150.0, height: 150.0)
                    .clipShape(Rectangle())
                    .overlay {
                        Rectangle()
                            .stroke(.ultraThickMaterial, lineWidth: 5)
                    }
                    .shadow(radius: 5)
                // Original Editing Text
                VStack(spacing: 5.0) {
                    Text("Édition originale:")
                        .fontWeight(.bold)
                    Text("Compteur")
                }
                // Editing by Text
                VStack(spacing: 5.0) {
                    Text("Édition crée par:")
                        .fontWeight(.bold)
                    Text("Julien Martres en partenariat avec les étudiants de la formation Studi.fr: Pierric Marye, Dylan Caetano, ... .")
                }
                // Spécials Thanks text
                VStack(spacing: 5.0) {
                    Text("Remerciements:")
                        .fontWeight(.bold)
                    
                    Text("L'école de formation STUDI qui a fourni les supports nécessaires pour les notions d'apprentissage et notre formateur, Monsieur Julien Martres, avec qui ce projet a vu le jour.")
                    
                    Link(destination: URL(string: "https://www.studi.com/fr?utm_source=studi-google&utm_medium=cpc&utm_campaign=Studi-marque&search&gclid=EAIaIQobChMIi6mY07LI9wIVRpBoCR1Pqw9CEAAYASAAEgLsZvD_BwE")!) {
                        Text("Site de STUDI.fr")
                            .fontWeight(.bold)
                            .foregroundColor(compteurVM.arrierePlan)
                            .padding()
                            .background(.thinMaterial)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                    .padding(.top)
                }
                // Publishing text
                VStack(spacing: 5.0) {
                    Text("Publiée par:")
                        .fontWeight(.bold)
                    Text("Julien Martres")
                }
                // Copyright text
                VStack(spacing: 5.0) {
                    Text("©2022 Tous droits réservés.")
                        .fontWeight(.bold)
                    
                    Text("Aucune partie du contenu de cette application ne peut être reproduite, transmise ou modifiée sans l'autorisation au préalable de l'éditeur.")
                }
            }
            .padding()
            .multilineTextAlignment(.center)
        }
        .background(compteurVM.arrierePlan)
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
            .environmentObject(CompteurViewModel())
    }
}

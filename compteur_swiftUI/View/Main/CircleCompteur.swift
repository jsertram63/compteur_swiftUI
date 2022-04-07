//
//  CircleCompteur.swift
//  compteur_swiftUI
//
//  Created by Dylan Caetano on 04/04/2022.
//

import SwiftUI

struct CircleCompteur: View {
    
    // Déclarez une variable fastingManager et initialisez
    // + la propriété StateObject Devant
    // La class FastingManager
    
   @StateObject var fastingManager = FastingManager()
    
    var body: some View {
        ZStack {
            // MARK: Background
            
            Color(#colorLiteral(red: 0.05033428222, green: 0.004766677506, blue: 0.2067147791, alpha: 1))
                .ignoresSafeArea()
            
            content
        } // ZSTACK
    }
    // Le contenu est une autre vue qui va retourner une vue.
    
    var content: some View {
        ZStack {
            VStack(spacing: 40) {
                // MARK: Titre
                
                Text("Compteur")
                    .font(.title)
                    .fontWeight(.bold)
                
                // MARK: Jeune Plan
                
                Text("16.8")
                    .fontWeight(.semibold)
                    .padding(.horizontal, 24)
                    .padding(.vertical, 8)
                    .background(.thinMaterial)
                    .cornerRadius(20)
                
                Spacer()
            }
            .padding()
            
            VStack(spacing: 40) {
            
                // MARK: Anneau de progression
                
                ProgressRingView()
                
                HStack(spacing: 60) {
                    // MARK: Start Temps
                    
                    VStack(spacing: 5) {
                        Text("Start")
                            .opacity(0.7)
                        
                        // TextDate represente la date actuelle
                        Text(Date(), format: .dateTime.weekday().hour().minute().second())
                            .fontWeight(.bold)
                    } // VSTACK
                    
                    VStack(spacing: 5) {
                        Text("Fin")
                            .opacity(0.7)
                        
                        // TextDate .addingTimeInterval Cela nous évite d'avoir a initialiser une autre variable de date et a calculer
                        Text(Date().addingTimeInterval(60), format: .dateTime.weekday().hour().minute().second())
                            .fontWeight(.bold)
                    } // VSTACK
                } // HSTACK
                
                // MARK: Button
                
                
                Button {
                    
                } label: {
                    Text("Start fasting")
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding(.horizontal, 24)
                        .padding(.vertical, 8)
                        .background(.thinMaterial)
                        .cornerRadius(20)
                }
            } // VSTACK
            .padding()
        } // ZSTACK
        .foregroundColor(Color.white)
    }
}

struct CircleCompteur_Previews: PreviewProvider {
    static var previews: some View {
        CircleCompteur()
    }
}

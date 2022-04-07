//
//  ProgressRingView.swift
//  compteur_swiftUI
//
//  Created by Dylan Caetano on 07/04/2022.
//

import SwiftUI

struct ProgressRingView: View {
    
    // @State var progress et définissez la valeur par defaut 0.0.
    //pour voir les modification dans l'aperçu.
    
    @State var progress = 0.0
    
    var body: some View {
        ZStack {
            // MARK: Anneau d'espace réservé
            
            Circle()
                .stroke(lineWidth: 6)
                .foregroundColor(.gray)
                .opacity(0.1)
            
            // MARK: Anneaux colorée
            
            Circle()
                .trim(from: 0.0, to: min(progress, 1.0))
                .stroke(AngularGradient(gradient: Gradient(colors: [
                    Color.blue,
                    Color.blue,
                    Color.pink,
                    Color.pink,
                    Color.blue
                ]),
                center: .center),
                style: StrokeStyle(lineWidth: 6, lineCap: .round, lineJoin: .round))
                .rotationEffect(Angle(degrees: 270))
                .animation(.easeInOut(duration: 1.0), value: progress)
            
            VStack(spacing: 30) {
                // MARK: Temps écoulé
                
                VStack(spacing: 5) {
                    Text("Temps écoulé")
                        .opacity(0.7)
                    
                    Text("0:00")
                        .font(.title)
                        .fontWeight(.bold)
                    
                } // VSTACK
                .padding(.top)
                
                // MARK: Temps restant
                
                VStack(spacing: 5) {
                    Text("Temps restant")
                        .opacity(0.7)
                    
                    Text("0:00")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                } // VSTACK
            } // VSTACK
            
        } // ZSTACK
        .foregroundColor(Color.white)
        .frame(width: 280, height: 280)
        .padding()
        
        // Et sur Apparaissent de la progression, attribuez la valeur 1
        
        .onAppear {
            progress = 1
        }
    }
}

struct ProgressRingView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressRingView()
            .previewLayout(.sizeThatFits)
            .background(Color(#colorLiteral(red: 0.05033428222, green: 0.004766677506, blue: 0.2067147791, alpha: 1)))
    }
}

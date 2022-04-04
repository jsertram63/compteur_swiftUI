//
//  CircleCompteur.swift
//  compteur_swiftUI
//
//  Created by Dylan Caetano on 04/04/2022.
//

import SwiftUI

struct CircleCompteur: View {
    // Création d'une propriété qui va servir pour notre enum
    @State var timeMode: TimeMode = .initial
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.06).edgesIgnoringSafeArea(.all)
                ZStack {
                    Circle()
                        .trim(from: 0, to: 1)
                        .stroke(Color.black.opacity(0.09), style: StrokeStyle(lineWidth: 15, lineCap: .round))
                        .frame(width: 280, height: 280)
                    Circle()
                        .trim(from: 0, to: 0.5)
                        .stroke(Color.blue, style: StrokeStyle(lineWidth: 15, lineCap: .round))
                        .frame(width: 280, height: 280)
                        .rotationEffect(.init(degrees: -90))
                    VStack {
                        Text("0000")
                            // Le compteur
                            .font(.system(size: 65))
                    } // VSTACK
                } // ZSTACK
                .padding(.bottom, 200)
                playPause
                .padding(.top, 490)
        } // ZSTACK
    }
}

struct CircleCompteur_Previews: PreviewProvider {
    static var previews: some View {
        CircleCompteur()
    }
}

extension CircleCompteur {
    // Button Play - Pause
    public var playPause: some View {
        VStack {
            Image(systemName: timeMode == .running ? "pause.circle.fill" : "play.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
        } // VSTACK
    }
}


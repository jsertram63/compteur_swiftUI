//
//  historiqueView.swift
//  compteur_swiftUI
//
//  Created by Pierric Marye on 16/03/2022.
//

import SwiftUI

struct historiqueView: View {
    var body: some View {
        
        ZStack {
            Color("Color1").ignoresSafeArea()
            
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
    }
}

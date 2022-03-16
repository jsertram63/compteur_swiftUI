//
//  PreferenceView.swift
//  compteur_swiftUI
//
//  Created by Pierric Marye on 16/03/2022.
//

import SwiftUI

struct PreferenceView: View {
    var body: some View {
        
        ZStack {
            Color("Color1").ignoresSafeArea()
            
            VStack {
                Text("Préférences")
            }
            .foregroundColor(.accentColor)
        }
    }
}

struct PreferenceView_Previews: PreviewProvider {
    static var previews: some View {
        PreferenceView()
    }
}

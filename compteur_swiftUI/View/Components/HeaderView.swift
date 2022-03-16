//
//  HeaderView.swift
//  compteur_swiftUI
//
//  Created by Lunack on 14/03/2022.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack{
            Text("0000")
                .font(.system(size: 75.0, weight: .bold))
                .foregroundColor(.accentColor)
                // ultraThinMaterial : effet de transparence
                //.background(.ultraThinMaterial)
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}

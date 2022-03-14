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
                .font(.system(size: 70.0,weight: .bold))
            
                .foregroundColor(.white)
                .padding()
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

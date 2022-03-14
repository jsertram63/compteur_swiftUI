//
//  ButtonsView.swift
//  compteur_swiftUI
//
//  Created by Lunack on 14/03/2022.
//

import SwiftUI

struct ButtonsView: View {
    var body: some View {
        HStack{
            Spacer()
            Image(systemName:"minus.square")
                .resizable()
                // change la couleur de l'image
                .foregroundColor(.white)
                .frame(width: 75, height: 75)
            Spacer()
            Image(systemName: "arrow.counterclockwise.circle")
                .resizable()
                // change la couleur de l'image
                .foregroundColor(.white)
                .frame(width: 75, height: 75)
            Spacer()
            Image(systemName:"plus.square")
                .resizable()
                // change la couleur de l'image
                .foregroundColor(.white)
                .frame(width: 75, height: 75)
            Spacer()
            
            
        }
    }
}

struct ButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsView()
    }
}

//
//  HeaderView.swift
//  compteur_swiftUI
//
//  Created by Lunack on 14/03/2022.
//

import SwiftUI

struct HeaderView: View {
    
    @EnvironmentObject  private var compteurViewModel: CompteurViewModel
    
    var body: some View {
        HStack{
            // formattage de Int -> String en la propriété déclarée
            Text(compteurViewModel.formattedCompteurEnCours)
                .font(.system(size: 75.0, weight: .bold))
                .foregroundColor(Color("Color5"))
                // ultraThinMaterial : effet de transparence
                //.background(.ultraThinMaterial)
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
            .environmentObject(CompteurViewModel())
    }
}

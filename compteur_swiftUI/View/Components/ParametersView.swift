//
//  ParametersView.swift
//  compteur_swiftUI
//
//  Created by Lunack on 14/03/2022.
//

import SwiftUI

struct ParametersView: View {
    var body: some View {
        HStack {
            Spacer()
            
            VStack(spacing: 5) {
                Text("Articles")
                    .font(.system(size: 35.0,weight: .bold))
                Text("3")
                    .font(.system(size: 25.0,weight: .bold))
            }
            .padding(.trailing)
        }
        .foregroundColor(Color("Color5"))
    }
}

struct ParametersView_Previews: PreviewProvider {
    static var previews: some View {
        ParametersView()
            .background(Color("Color1"))
    }
}

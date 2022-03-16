//
//  NavigationBarView.swift
//  compteur_swiftUI
//
//  Created by Pierric Marye on 16/03/2022.
//

import SwiftUI

struct NavigationBarView: View {
    var body: some View {
        HStack {
            Text("Compteur")
                .font(.system(size: 50, weight: .bold, design: .rounded))
                .foregroundColor(Color("Color3"))
            
            Spacer()
        }
    }
}

struct NavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarView()
    }
}

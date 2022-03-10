//
//  ContentView.swift
//  compteur_swiftUI
//
//  Created by Lunack on 07/03/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 0.0) {
            Text("Dylan Cto")
                .padding()
            Color.blue.edgesIgnoringSafeArea(.top)
            Color.blue.edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

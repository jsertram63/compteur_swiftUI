//
//  ContentView.swift
//  compteur_swiftUI
//
//  Created by Lunack on 07/03/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Spacer()
            HeaderView()
            Spacer()
            HStack {
                Spacer()
                ParametersView()
                    .padding(20)
            }
            Spacer()
            ButtonsView()
            Spacer()
            Button(action: {
                
            }) {
                Text("Sauvegarder")
            }
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .background(.blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

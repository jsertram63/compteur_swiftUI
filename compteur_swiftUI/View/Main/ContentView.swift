//
//  ContentView.swift
//  compteur_swiftUI
//
//  Created by Lunack on 07/03/2022.
//

import SwiftUI

struct ContentView: View {
    
    //
    init() {
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().barTintColor = UIColor(named: "Color1")
    }
    
    var body: some View {
        TabView {
            CompteurView()
                .tabItem{
                    Image(systemName: "10.square.fill")
                    Text("Compteur")
                }
            
            historiqueView()
                .tabItem{
                    Image(systemName: "list.bullet")
                    Text("Compteur")
                }
            
            PreferenceView()
                .tabItem {
                    Image(systemName: "filemenu.and.selection")
                    Text("Préférences")
                }
        }
        .accentColor(.blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            //.preferredColorScheme(.dark)
    }
}

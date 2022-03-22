//
//  ContentView.swift
//  compteur_swiftUI
//
//  Created by Lunack on 07/03/2022.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject  private var compteurViewModel: CompteurViewModel
    
    // initialisation de la tabBar pour effectuer des modifications sur celle-ci
    init() {
        UITabBar.appearance().isTranslucent = false
    }
    
    var body: some View {
        // Tabview : container pour implémenter une tabbar (3 onglets)
        TabView {
            // onglet compteur
            CompteurView()
                // création des éléments de la tabBar
                .tabItem{
                    Image(systemName: "10.square.fill") // sfSympbol
                    Text("Compteur")
                }
            // onglet historique
            historiqueView()
                .tabItem{
                    Image(systemName: "list.bullet")
                    Text("Historiques")
                }
            // onglet preferences
            PreferenceView()
                .tabItem {
                    Image(systemName: "filemenu.and.selection")
                    Text("Préférences")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(CompteurViewModel())
    }
}

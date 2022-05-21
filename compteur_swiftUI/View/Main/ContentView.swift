//
//  ContentView.swift
//  compteur_swiftUI
//
//  Created by Lunack on 07/03/2022.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject  private var compteurVM: CompteurViewModel
    @EnvironmentObject  private var PickerVM: PickerViewModel
    
    private var colorData = ColorData()
    
    // initialisation de la tabBar pour effectuer des modifications sur celle-ci
    init() {
        UITabBar.appearance().isTranslucent = false
    }
    
    var body: some View {
        // Tabview : View container pour implémenter une tabbar (4 onglets)
        TabView {
            // onglet compteur
            CompteurView()
            // création des éléments de la tabBar
                .tabItem{
                    Image(systemName: "10.square.fill") // sfSympbol
                    Text("Compteur")
                }
            
            // onglet historique
            HistoriqueView()
                .tabItem{
                    Image(systemName: "list.bullet")
                    Text("Historiques")
                }
            
            // onglet historique
            TimerView()
                .tabItem{
                    Image(systemName: "timer")
                    Text("Timer")
                }
            
            // onglet preferences
            PreferenceView()
                .tabItem {
                    Image(systemName: "filemenu.and.selection")
                    Text("Préférences")
                }
            
            // onglet crédits
            CreditsView()
                .tabItem {
                    Image(systemName: "info.circle.fill")
                    Text("Crédits")
                }
        }
        .onAppear {
            compteurVM.categoriePicker.removeAll()
            PickerVM.pickerArray.forEach { pref  in
                compteurVM.categoriePicker.append(pref.picker)
            }
            compteurVM.arrierePlan = colorData.loadColor()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(CompteurViewModel())
            .environmentObject(TimerViewModel())
            .environmentObject(PickerViewModel())
    }
}

/** Extension de View */

extension View {
    func cacherClavier() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}

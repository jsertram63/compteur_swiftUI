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
    
    @AppStorage("premiereUtilisation") var premiereUtilisation: Bool = false
    
    let screenSize = UIScreen.main.bounds
    
    private var colorData = ColorData()
    
    // initialisation de la tabBar pour effectuer des modifications sur celle-ci
    init() {
        UITabBar.appearance().isTranslucent = false
    }
    
    var body: some View {
        // tabView
        if premiereUtilisation {
            tabView
        } else {
            accueilView
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

/* ******************************* Extension de View ************************************ */

extension View {
    func cacherClavier() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}

extension ContentView {
    // TabView
    private var tabView: some View {
        // Tabview : View container pour implémenter une tabbar (4 onglets)
        TabView {
            // onglet compteur
            CompteurView()
            // création des éléments de la tabBar
                .tabItem{
                    Image(systemName: "10.square.fill") // sfSympbol
                    Text("Compteur")
                }
            
            // onglet minuterie
            TimerView()
                .tabItem{
                    Image(systemName: "timer")
                    Text("Minuteur")
                }
            
            // onglet historique
            HistoriqueView()
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
    
    // Accueil
    private var accueilView: some View {
        TabView {
            // Première page
            VStack(spacing: 25.0) {

                Image("counter")

                VStack(alignment: .center, spacing: 10.0) {
                    Text("Bienvenue dans TouComptage.")
                        .font(.title3)
                        .fontWeight(.bold)

                    Text("Au travers ce petit didactiel, vous allez découvrir comment utiliser au mieux les différences fonctionnalités de notre application.")
                        .fontWeight(.medium)

                    Text("TouComptage va vous permettre de réaliser des comptages selon vos besoins, la possibilité d'avoir une minuterie et de paramétrer vos préférences selon vos goûts.")
                        .fontWeight(.medium)
                }
                .multilineTextAlignment(.center)
                .padding()
            }
            .frame(width: screenSize.width * 0.9, height: screenSize.height * 0.7)
            .background(.regularMaterial)
            .cornerRadius(15)
            .shadow(radius: 5)
            .padding()
            
            // Seconde page
            VStack {
                HStack {
                    Text("Le compteur")
                        .font(.title3)
                    .fontWeight(.bold)
                    
                    Spacer()
                }
                
                Divider().padding(.bottom)
                
                VStack(alignment: .center) {
                    HStack(alignment: .center) {
                        Image("Compteur")
                            .resizable()
                            .foregroundColor(.cyan)
                            .frame(width: 150, height: 125)
                        
                        Image("Compteur2")
                            .resizable()
                            .foregroundColor(.cyan)
                            .frame(width: 150, height: 125)
                    }
                }
            }
            .padding()
            .frame(width: screenSize.width * 0.9, height: screenSize.height * 0.7)
            .background(.regularMaterial)
            .cornerRadius(25)
        }
        .tabViewStyle(PageTabViewStyle())
        .background(compteurVM.arrierePlan.ignoresSafeArea())
    }
}

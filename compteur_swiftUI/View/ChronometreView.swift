//
//  ChronometreVIew.swift
//  compteur_swiftUI
//
//  Created by Pierric Marye on 29/05/2022.
//

import SwiftUI

struct ChronometreView: View {
    @ObservedObject var ChronometreVM = ChronometreViewModel()
    @EnvironmentObject var CompteurVM: CompteurViewModel
    
    let screenSize = UIScreen.main.bounds
    
    var body: some View {
        ZStack {
            CompteurVM.arrierePlan.ignoresSafeArea()
            
            VStack(alignment: .center, spacing: 25.0) {
                
                VStack(alignment: .center, spacing: 50.0) {
                    // Vue Temps
                    HStack(alignment: .center) {
                        Text(self.ChronometreVM.stopWatchTime)
                            .font(.system(size: 50, weight: .heavy, design: .rounded))
                            .foregroundColor(CompteurVM.arrierePlan)
                        
                    }
                    .frame(width: screenSize.width * 0.75, height: screenSize.height * 0.15)
                    .padding(15.0)
                    .background(.regularMaterial)
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0, y: 0)
                    
                    // Vue Boutons
                    HStack(alignment: .center, spacing: 40.0) {
                        Spacer()
                        
                        // Boutons Effacer/Tour
                        StopWatchButton(actions: [self.ChronometreVM.reset, self.ChronometreVM.lap],
                                        labels: ["Effacer", "Tour"],
                                        color: Color.orange,
                                        isPaused: self.ChronometreVM.isPaused())
                        
                        Spacer()
                        
                        // Bouton démarrer/Stop
                        StopWatchButton(actions: [self.ChronometreVM.start, self.ChronometreVM.pause],
                                        labels: ["Démarrer", "Pause"],
                                        color: CompteurVM.arrierePlan,
                                        isPaused: self.ChronometreVM.isPaused())
                        
                        Spacer()
                    }
                    
                    VStack(alignment: .leading) {
                        HStack(alignment: .center) {
                            Text("Tours")
                                .font(.title3)
                                .foregroundColor(CompteurVM.arrierePlan)
                                .fontWeight(.bold)
                                
                            
                            Spacer()
                        }
                        
                        Divider()
                        
                        ScrollView(showsIndicators: false) {
                            ForEach(self.ChronometreVM.laps, id: \.uuid) {(TourItem) in
                                    Text("\(TourItem.stringTime)")
                                    .foregroundColor(CompteurVM.arrierePlan)
                                    .fontWeight(.bold)
                                    .padding(.vertical, 1.0)
                            }
                        }
                    }
                    .frame(width: screenSize.width * 0.75, height: screenSize.height * 0.45)
                    .padding(15.0)
                    .background(.thinMaterial)
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0, y: 0)
//                    List {
//                        Section(
//                            header:
//                                Text("Tours")
//                                .font(.title3)
//                                .foregroundColor(.black)
//                                .fontWeight(.bold)
//                                .padding(.leading, 10.0)
//
//                        ) {
//                            ForEach(self.ChronometreVM.laps, id: \.uuid) { (TourItem) in
//                                Text("\(TourItem.stringTime)")
//                                    .padding(.leading, 10.0)
//                            }
//                        }
//                    }
//                    .listStyle(PlainListStyle())
                }
            }
        }
    }
}

/** Vue  bouton arrêter **  */

struct StopWatchButton : View {
    var actions: [() -> Void]
    var labels: [String]
    var color: Color
    var isPaused: Bool
    
    var body: some View {
        let screenSize = UIScreen.main.bounds
        
        return Button(action: {
            if self.isPaused {
                self.actions[0]()
            } else {
                self.actions[1]()
            }
        }) {
            if isPaused {
                Text(self.labels[0])
                    .foregroundColor(self.color)
                    .fontWeight(.bold)
            } else {
                Text(self.labels[1])
                    .foregroundColor(self.color)
                    .fontWeight(.bold)
            }
        }
        .padding()
        .frame(width: screenSize.width * 0.3, height: screenSize.height * 0.05)
        .background(.regularMaterial)
        .cornerRadius(5)
        .shadow(color: Color.black.opacity(0.5), radius: 2, x: 2, y: 2)
    }
}

struct ChronometreView_Previews: PreviewProvider {
    static var previews: some View {
        ChronometreView()
            .environmentObject(CompteurViewModel())
            .environmentObject(ChronometreViewModel())
    }
}

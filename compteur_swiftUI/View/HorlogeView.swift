//
//  HorlogeView.swift
//  compteur_swiftUI
//
//  Created by Pierric Marye on 29/05/2022.
//

import SwiftUI

struct HorlogeView: View {
    @EnvironmentObject var timerVM: TimerViewModel
    @EnvironmentObject var CompteurVM: CompteurViewModel
    @ObservedObject var ChronometreVM = ChronometreViewModel()
    
    var body: some View {
        ZStack {
            CompteurVM.arrierePlan.ignoresSafeArea()
            
            VStack {
                TabView {
                    // onglet minuterie
                    TimerView()
                    
                    // onglet chronomètre
                    ChronometreView()
                }
                .tabViewStyle(PageTabViewStyle())
            }
        }
    }
}

struct HorlogeView_Previews: PreviewProvider {
    static var previews: some View {
        HorlogeView()
            .environmentObject(CompteurViewModel())
            .environmentObject(TimerViewModel())
            .environmentObject(ChronometreViewModel())
    }
}

//
//  TimerViewModel.swift
//  compteur_swiftUI
//
//  Created by Pierric Marye on 21/05/2022.
//

import Foundation
import SwiftUI

class TimerViewModel: NSObject, ObservableObject {
    @Published var progression: CGFloat = 1
    @Published var timerString: String = "00:00"
    @Published var timerDemarre: Bool = false
    @Published var timerTermine: Bool = false
    @Published var ajoutTimer: Bool = false
    
    @Published var heures: Int = 0
    @Published var minutes: Int = 0
    @Published var secondes: Int = 0
    
    @Published var totalSecondes: Int = 0
    @Published var TotalSecondesStatiques: Int = 0
    
    func startTimer() {
        withAnimation(.easeInOut(duration: 0.25)) { timerDemarre = true }
        timerString = "\(heures == 0 ? "" : "\(heures):")\(minutes >= 10 ? "\(minutes)" : "0\(minutes):")\(secondes >= 10 ? "\(secondes)" : "0\(secondes)")"
        
        totalSecondes = (heures * 3600) + (minutes * 60) + secondes
        TotalSecondesStatiques = totalSecondes
        ajoutTimer = false
    }
    
    func stopTimer() {
        withAnimation {
            timerDemarre = false
            heures = 0
            minutes = 0
            secondes = 0
            progression = 1
        }
        totalSecondes = 0
        TotalSecondesStatiques = 0
        timerString = "00:00"
    }
    
    func updateTimer() {
        totalSecondes -= 1
        heures = totalSecondes / 3600
        minutes = (totalSecondes / 60) % 60
        secondes = (totalSecondes % 60)
        
        timerString = "\(heures == 0 ? "" : "\(heures):")\(minutes >= 10 ? "\(minutes)" : "0\(minutes)"):\(secondes >= 10 ? "\(secondes)" : "0\(secondes)")"
        
        if heures == 0 && minutes == 0 && secondes == 0 {
            timerDemarre = false
            timerTermine = true
        }
        
        progression = CGFloat(totalSecondes) / CGFloat(TotalSecondesStatiques)
        progression = (progression < 0 ? 0 : progression)
    }
}

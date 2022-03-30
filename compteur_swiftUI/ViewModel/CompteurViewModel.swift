//
//  CompteurViewModel.swift
//  compteur_swiftUI
//
//  Created by Lunack on 21/03/2022.
//

import Foundation
import SwiftUI

class CompteurViewModel : ObservableObject {
    // déclaration de variables qui pourront être modifiée grâce à @Published
    
    // CompteurView
    @Published var compteurEnCours = 0
    @Published var pasDuCompteur = 1
    
    @Published var alertEstVisible = false
    
    // Propriété déclarée qui convertie compteurEnCours de type String avec quatre caractères 0000
    var formattedCompteurEnCours: String {
        return String(format: "%04d", compteurEnCours)
    }
    
    // les fonctions de notre compteur
    func incCompteur(){
        compteurEnCours += pasDuCompteur
    }
    
    func decCompteur() {
        if compteurEnCours <= 0 {
            compteurEnCours = 0
        } else {
            compteurEnCours -= pasDuCompteur
        }
    }
    
    func resetCompteur() {
        compteurEnCours = 0
    }
    
    // PreferenceView
    @Published var intituleCompteur = ["Posts", "Articles", "Votes"]
    @Published var indexSelectionne = "Posts"
    
    @Published var arrièrePlan = Color("Color1")
    @Published var opaciteSelectionnee = 1.0
}

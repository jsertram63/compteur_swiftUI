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
    @Published var compteurEnCours = 0000
    @Published var pasDuCompteur = 1
    @Published var intituleCompteur = []
    @Published var alertEstVisible = false
    
    var formattedCompteurEnCours: String {
        return String(format: "%04d", compteurEnCours)
    }
    
    // les fonctions de notre compteur
    func incCompteur(){
        compteurEnCours = compteurEnCours + 1
    }
    
    func decCompteur() {
        if compteurEnCours > 0 {
            compteurEnCours = compteurEnCours - 1
        }
       
    }
    
    func resetCompteur() {
        compteurEnCours = 0
    }
}

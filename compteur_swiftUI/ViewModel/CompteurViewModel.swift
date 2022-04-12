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
    @Published var modaleAjoutAffichee = false
    @Published var modaleSuppAffichee = false
    
    // Propriété déclarée qui convertie compteurEnCours de type String avec quatre caractères 0000
    var compteurEnCoursFormatte: String {
        return String(format: "%04d", compteurEnCours)
    }
    
    // les fonctions de notre compteur
    func incCompteur() {
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
    
    // permet de retirer un élément du picker tout en mettant à jour l'index du tableau
    func removeElementOfPicker(indexSel: Int) {
        indexSelectionne = 0
        if (intituleCompteur.count > 1){
            intituleCompteur.remove(at: indexSel)
        }
       
    }
    
    // PreferenceView
    @Published var intituleCompteur = ["Posts", "Articles", "Votes", "Tours"]
    @Published var indexSelectionne = 0
    
    @Published var arrierePlan = Color("Color1")
}

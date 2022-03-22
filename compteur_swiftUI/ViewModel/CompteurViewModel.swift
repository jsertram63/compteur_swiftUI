//
//  CompteurViewModel.swift
//  compteur_swiftUI
//
//  Created by Lunack on 21/03/2022.
//

import Foundation


class CompteurViewModel : ObservableObject {
    // déclaration d'une variable String et pourra être modifier
    @Published var digitalNumber:String = "0000"
    @Published var compteurEnCourant:Int = 0
    @Published var pasDuCompteur:Int = 1
    @Published var intituleCompteur: String = "Posts"
    @Published var alertEstVisible : Bool = false;
    
    // les fonctions de notre compteur
    func incCompteur(){
        
        compteurEnCourant = compteurEnCourant + 1
    }
    
    func decCompteur() {
        if (compteurEnCourant > 0){
            compteurEnCourant = compteurEnCourant - 1
        }
       
    }
    
    func resetCompteur() {
        compteurEnCourant = 0
    }
    
}




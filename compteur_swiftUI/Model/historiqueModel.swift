//
//  historiqueModel.swift
//  compteur_swiftUI
//
//  Created by Pierric Marye on 27/04/2022.
//

import Foundation

struct HistoriqueModel: Identifiable, Codable {
    let id: String
    let categorie: String
    let compteur: String
    let pasCompteur: Int
    let date: String
    
    init(id: String = UUID().uuidString, categorie: String, compteur: String, pasCompteur: Int, date: String) {
        self.id = id
        self.categorie = categorie
        self.compteur = compteur
        self.pasCompteur = pasCompteur
        self.date =  date
    }
    
    func updateCompletion() -> HistoriqueModel {
        return HistoriqueModel(id: id, categorie: categorie, compteur: compteur, pasCompteur: pasCompteur, date: date)
    }
}

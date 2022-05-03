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
    
    init(id: String = UUID().uuidString, categorie: String, compteur: String, pasCompteur: Int) {
        self.id = id
        self.categorie = categorie
        self.compteur = compteur
        self.pasCompteur = pasCompteur
    }
    
    func updateCompletion() -> HistoriqueModel {
        return HistoriqueModel(id: id, categorie: categorie, compteur: compteur, pasCompteur: pasCompteur)
    }
}

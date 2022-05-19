//
//  CompteurViewModel.swift
//  compteur_swiftUI
//
//  Created by Lunack on 21/03/2022.
//

import Foundation
import SwiftUI

class CompteurViewModel : ObservableObject {
    /* ****************************** CompteurView *********************************************** */
    
    // déclaration de variables qui pourront être modifiée grâce à @Published
    @Published var compteur = 0
    @Published var pasDuCompteur = 1
    
    var dateFormatee: String {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        dateFormatter.locale = Locale(identifier: "fr")
        return dateFormatter.string(from: date)
    }
    
    // Propriété déclarée qui convertie compteurEnCours de type String avec quatre caractères 0000
    var compteurEnCoursFormatte: String {
        return String(format: "%04d", compteur)
    }
    
    // les fonctions de notre compteur
    func incCompteur() {
        compteur += pasDuCompteur
    }
    
    func decCompteur() {
        if compteur <= 0 {
            compteur = 0
        } else {
            compteur -= pasDuCompteur
        }
    }
    
    func resetCompteur() {
        compteur = 0
    }
    
    /* ****************************** HistoriqueView ********************************************* */
    
    @Published var historique: [HistoriqueModel] = [] {
        didSet {
            sauvegardeHistorique()
        }
    }
    
    let itemsKey: String = "historique_list"
    
    // Initialisation de la classe
    init() {
        recupHistorique()
    }
    
    // Récupération de l'historique
    func recupHistorique() {
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([HistoriqueModel].self, from: data)
        else {return}
        
        self.historique = savedItems
    }
    
    // Suppression historique
    func suppHistorique(indexSet: IndexSet) {
        historique.remove(atOffsets: indexSet)
    }
    
    // Ajout d'un historique
    func ajoutHistorique(compteur: String, categorie: String, pasCompteur: Int, date: String, note: String) {
        let nouvelHistorique = HistoriqueModel(categorie: categorie, compteur: compteur, pasCompteur: pasCompteur, date: date, note: note)
        historique.append(nouvelHistorique)
    }
    
    // Mise à jour historique
    func miseAJourHistorique(item: HistoriqueModel) {
        if let index = historique.firstIndex(where: {$0.id == item.id}) {
            historique[index] = item.updateCompletion()
        }
    }
    
    // Sauvegarde historique
    func sauvegardeHistorique() {
        if let encodedData = try? JSONEncoder().encode(historique) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey )
        }
    }
    
    /* ****************************** PreferenceView ********************************************* */
    
    // Propriétés déclarée publiées au travers des vues
    
    // Arrière plan
    @Published var arrierePlan = Color.accentColor
    
    // Picker
    @Published var intituleCompteur = ["Posts", "Articles", "Votes", "Tours"]
    @Published var indexSelectionne = 0
    
    // permet de retirer un élément du picker tout en mettant à jour l'index du tableau
    func removeElementOfPicker(indexSel: Int) {
        indexSelectionne = 0
        if (intituleCompteur.count > 1) {
            intituleCompteur.remove(at: indexSel)
        }
    }
}

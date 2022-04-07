//
//  FastingManager.swift
//  compteur_swiftUI
//
//  Created by Dylan Caetano on 07/04/2022.
//

import Foundation

// Une énumération pour l'état de jeune

enum FastingState {
    case notStarted
    case fasting
    case feeding
}

// Créez une nouvelle classe FastingManager conforme a ObservableObject.
// De cette façon, cela permettra a cette class de devenir un éditeur et,
// informera les vues dépendantes de tout changement se produisant dans ses propriétés.

class FastingManager: ObservableObject {
    @Published private(set) var fastingState: FastingState = .notStarted
}

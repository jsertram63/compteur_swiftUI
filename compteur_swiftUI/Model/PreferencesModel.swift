//
//  PreferencesModel.swift
//  compteur_swiftUI
//
//  Created by Pierric Marye on 15/05/2022.
//

import Foundation

struct PreferencesModel: Hashable, Codable, Identifiable {
    var id: UUID
    var picker: String
}

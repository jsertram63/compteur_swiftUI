//
//  jsonModel.swift
//  compteur_swiftUI
//
//  Created by Lunack on 18/04/2022.
//

import Foundation


struct JsonModel: Hashable, Codable, Identifiable {
    var id = UUID().uuidString
    var libelle: String
    var pasIcremental: Int
}

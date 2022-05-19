//
//  PreferencesViewModel.swift
//  compteur_swiftUI
//
//  Created by Pierric Marye on 15/05/2022.
//

import Foundation

class PickerViewModel: ObservableObject {
    @Published var pickerArray : [PickerModel]
    
    
    init() {
        self.pickerArray = Bundle.load("picker")
    }
    
    // Écrire des données du json dans file manager
    func writeJSON() {
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let jsonURL = documentDirectory
            .appendingPathComponent("picker")
            .appendingPathExtension("json")
        try? JSONEncoder().encode(pickerArray).write(to: jsonURL, options: .atomic)
    }
}

// Function to load data
extension Bundle {
    static func load<T: Decodable>(_ filename: String) -> T {

        let readURL = Bundle.main.url(forResource: filename, withExtension: "json")!
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        let jsonURL = documentDirectory
            .appendingPathComponent(filename)
            .appendingPathExtension("json")

        if !FileManager.default.fileExists(atPath: jsonURL.path) {
            try? FileManager.default.copyItem(at: readURL, to: jsonURL)
        }
        
        // returning the parsed data
        return try! JSONDecoder().decode(T.self, from: Data(contentsOf: jsonURL))
    }
}

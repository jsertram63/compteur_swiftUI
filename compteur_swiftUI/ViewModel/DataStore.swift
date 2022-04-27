//
//  DataStore.swift
//  compteur_swiftUI
//
//  Created by Lunack on 18/04/2022.
//

import Foundation



class DataStore : ObservableObject {
    
    @Published var jsonModel: [JsonModel] = []
    
    init(){
        print(FileManager.docDirURL.path)
        if FileManager().docExist(name: fileName){
            // chargement des données
            loadPreferences()
        }
    }
    
    
    func savePreferences() {
        print("Sauvegarde des préférences")
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(jsonModel)
            let jsonString = String(decoding: data, as: UTF8.self)
            FileManager().saveDocument(contents: jsonString, docName: fileName) { (error) in
                if let error = error {
                    print(error)
                }
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func loadPreferences(){
        print("chargement des préférences")
        FileManager().readDocument(docName: fileName) { (result) in
            switch result {
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    jsonModel = try decoder.decode([JsonModel].self, from:data)
                }catch {
                    print(error.localizedDescription)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
                
            }
        }
    
    func addPref(_ pref: JsonModel){
        //jsonModel.removeAll()
        savePreferences()
    }
    
    
    
    
    
 
    
    
    
    
    
}

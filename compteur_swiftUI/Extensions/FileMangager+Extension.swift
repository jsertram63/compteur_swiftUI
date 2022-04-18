//
//  FileMangager+Extension.swift
//  compteur_swiftUI
//
//  Created by Lunack on 18/04/2022.
//

import Foundation

let fileName = "Preferences.json"


extension FileManager {
    
    // variable qui va récupérer le chemin d'accès aux données de l'application (cache)
    static var docDirURL:URL {
        return Self.default.urls(for: .documentDirectory, in: .userDomainMask).first!;
    }
    
    
    // la fonction qui va sauvegarder dans le systeme de fichier de l'application
    func saveDocument(contents: String, docName:String, completion:(Error?) -> Void){
        let url = Self.docDirURL.appendingPathComponent(docName)
        do {
            try contents.write(to:url, atomically: true, encoding:.utf8)
        } catch {
            completion(error)
        }
    }
    
    // la fonction qui va lire/chargé les données
    func readDocument(docName:String, completion:(Result<Data,Error>) -> Void){
        let url = Self.docDirURL.appendingPathComponent(docName)
        do {
            let data = try Data(contentsOf: url)
            completion(.success(data))
        } catch {
            completion(.failure(error))
        }
    }
    
    func docExist(name docName: String) -> Bool{
        fileExists(atPath: Self.docDirURL.appendingPathComponent(docName).path)
    }
    
}

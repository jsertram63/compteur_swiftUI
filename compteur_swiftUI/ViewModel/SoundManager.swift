//
//  SoundManager.swift
//  compteur_swiftUI
//
//  Created by Pierric Marye on 07/05/2022.
//

import Foundation
import AVKit

class SoundManager: ObservableObject {
    static let instance = SoundManager()
    
    var lecteur: AVAudioPlayer?
    
    func jouerSon(son: String) {
        guard let url = Bundle.main.url(forResource: son, withExtension: ".mp3") else { return }
        
        do {
            lecteur = try AVAudioPlayer(contentsOf: url)
            lecteur?.play()
        } catch let error {
            print("Error playing sound. \(error.localizedDescription)")
        }
    }
    
    func arreterSon() {
        lecteur?.stop()
    }
}

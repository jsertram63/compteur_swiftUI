//
//  ColorViewModel.swift
//  compteur_swiftUI
//
//  Created by Pierric Marye on 18/05/2022.
//

import SwiftUI
import UIKit
import Foundation

class ColorData {
    private var COLOR_KEY = "COLOR_KEY"
    private let userDefaults = UserDefaults.standard
    
    func saveColor(color: Color) {
        // Convert the color into RGB
        let color = UIColor(color).cgColor
        
        // Save the RGB into an array
        if let components = color.components {
            userDefaults.set(components, forKey: COLOR_KEY)
            
            print("Colour saved!")
        }
    }
    
    func loadColor() -> Color{
        // Get the RGB array
        guard let array = userDefaults.object(forKey: COLOR_KEY) as? [CGFloat] else { return Color.accentColor }
        
        // Create a color from the RGB array
        let color = Color(.sRGB,
                          red: array[0],
                          green: array[1],
                          blue: array[2],
                          opacity: array[3])
        
        print("Colour loaded!")
        return color
    }
}

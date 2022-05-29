//
//  TourItem.swift
//  compteur_swiftUI
//
//  Created by Pierric Marye on 29/05/2022.
//

import Foundation

struct TourItem {
    let uuid = UUID()
    let count: Int
    let stringTime: String
    
    init(count: Int, diff: Int = -1) {
        self.count = count
        
        if diff < 0 {
            self.stringTime = ChronometreViewModel.convertCountToTimeString(counter: count)
        } else {
            self.stringTime = ChronometreViewModel.convertCountToTimeString(counter: diff)
        }
    }
}

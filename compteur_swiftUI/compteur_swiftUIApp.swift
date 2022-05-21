//
//  compteur_swiftUIApp.swift
//  compteur_swiftUI
//
//  Created by Lunack on 07/03/2022.
//

import SwiftUI

@main
struct compteur_swiftUIApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(CompteurViewModel())
                .environmentObject(TimerViewModel())
                .environmentObject(PickerViewModel())
        }
    }
}

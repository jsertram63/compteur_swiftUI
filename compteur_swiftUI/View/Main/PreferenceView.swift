//
//  PreferenceView.swift
//  compteur_swiftUI
//
//  Created by Pierric Marye on 16/03/2022.
//

import SwiftUI

struct PreferenceView: View {
    private var libelles:[String] = ["Posts","Articles","Votes"]
    @State var pas: Int = 1
    
    private var colors = ["Red", "Green", "Blue"] // <1>
    @State private var selectedLibelleIndex = 0
    var body: some View {
        
        
        ZStack {
            Color("Color1").ignoresSafeArea()
            
            VStack {
                HStack() {
                    VStack(alignment: .leading) {
                        Stepper("Pas : \(pas)",value: $pas,in: 1...100)
                        Text("\(libelles[selectedLibelleIndex])")
                        
                        Picker("Sélectionez un libelle", selection: $selectedLibelleIndex, content: {
                                    ForEach(0..<libelles.count, content: { index in // <2>
                                        Text(libelles[index]) // <3>
                                    })
                                })
                            }
                    .padding()
                    
                }
                .pickerStyle(WheelPickerStyle())
            }
            .foregroundColor(Color("Color5"))
        }
    }
}

struct PreferenceView_Previews: PreviewProvider {
    static var previews: some View {
        PreferenceView()
    }
}

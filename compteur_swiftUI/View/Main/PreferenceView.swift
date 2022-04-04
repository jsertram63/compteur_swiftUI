//
//  PreferenceView.swift
//  compteur_swiftUI
//
//  Created by Pierric Marye on 16/03/2022.
//

import SwiftUI
import UIKit





struct PreferenceView: View {
    
    @EnvironmentObject  private var compteurViewModel: CompteurViewModel
    
    var body: some View {
        
        ZStack {
            Color("Color1")
                .ignoresSafeArea()
            
            VStack(spacing: 25.0) {
                header
        
                Divider()
                    .background(Color.black)
                
                resumeParameter
                
                parameters
                
                Spacer()
            }
            .padding()
            .foregroundColor(Color("Color5"))
        }
    }
    
    struct PreferenceView_Previews: PreviewProvider {
        static var previews: some View {
            PreferenceView()
                .environmentObject(CompteurViewModel())
        }
    }
}

/* ********************************************************************************************** */


extension PreferenceView {
    func alertTF(title:String,message:String, hintText: String, primaryTitle:String,
                 secondaryTitle:String, primaryAction: @escaping(String) -> (),
                 secondaryAction:@escaping() ->()){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addTextField { field in
            field.placeholder = hintText
        }
        
        alert.addAction(.init(title: secondaryTitle, style: .cancel, handler: { _ in
            secondaryAction()
        }))
        
        alert.addAction(.init(title: primaryTitle, style: .default, handler: { _ in
            if let text = alert.textFields?[0].text{
                primaryAction(text)
                
            }else {
                primaryAction("")
            }
        }))
        
        rootController().present(alert, animated: true, completion: nil)
        
    }
    
    func rootController() -> UIViewController{
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .init()
        }
        guard let root = screen.windows.first?.rootViewController else {
            return .init()
        }
        
        return root
    }
    
}


extension PreferenceView {
    // Header
    private var header: some View {
        HStack(alignment: .center) {
            Text("Préférences")
                .font(.system(size: 40, weight: .bold, design: .rounded))
                .foregroundColor(Color("Color3"))
                
            
            Spacer()
        }
    }
    
    // ResumeParameter
    private var resumeParameter: some View {
        VStack(alignment: .leading) {
            Stepper("incrémentation de: \(compteurViewModel.pasDuCompteur)", value: $compteurViewModel.pasDuCompteur, in: 1...100)
            
            Text("Cotégorie: \(compteurViewModel.indexSelectionne)")
            
            HStack(alignment: .center) {
                Text("Votre thème: ")
                
                ZStack {
                    Image(systemName: "square.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 25.0, height: 25.0)
                        .clipShape(Rectangle())
                        .foregroundColor(compteurViewModel.arrièrePlan.opacity(compteurViewModel.opaciteSelectionnee))
                }
                .padding(2.0)
                .background(Color.white)
                .clipShape(Rectangle())
                .cornerRadius(5)
            }
        }
        .padding(.bottom)
    }
    
    // Parameters
    private var parameters: some View {
        VStack(spacing: 25.0) {
            Picker("Choisir une catégorie", selection: $compteurViewModel.indexSelectionne) {
                ForEach(compteurViewModel.intituleCompteur, id: \.self) { index in
                    Text(index)
                        .fontWeight(.medium)
                }
            }
            .pickerStyle(WheelPickerStyle())
            
            HStack {
                Spacer()
                Button {
                    alertTF(title: "Ajouter une category", message: "Saisir une catégorie", hintText: "category", primaryTitle: "OK", secondaryTitle: "Annuler") { text in
                        print(text)
                    } secondaryAction: {
                        print("cancel")
                    }

                
                    
                } label: {
                    Text("Ajouter")
                        .foregroundColor(Color.blue)
                
                        
                }
               
                
                

                Spacer()
                
                Button {
                    
                } label: {
                    Text("Retirer")
                        .foregroundColor(Color.red)
                }
                Spacer()
             
                
            }
            ColorPicker("Choisissez votre thème:", selection: $compteurViewModel.arrièrePlan, supportsOpacity: true)
                .font(.body)
            
         
        }
        .padding([.leading, .bottom, .trailing])
        .background(.ultraThinMaterial)
        .cornerRadius(15)
        .overlay(alignment: .topLeading) {
            Button {
                // Remise à l'initial des variables
                compteurViewModel.arrièrePlan = Color("Color1")
                compteurViewModel.opaciteSelectionnee = 1.0
                compteurViewModel.pasDuCompteur = 1
                compteurViewModel.indexSelectionne = "Posts"
            } label: {
                Image(systemName: "arrow.counterclockwise")
                    .frame(width: 15.0, height: 15.0)
                    .font(.headline)
                    .padding(12.0)
                    .foregroundColor(.primary)
                    .background(.thickMaterial)
                    .cornerRadius(15)
                    .shadow(radius: 5)
            }
            .padding(12.0)
        }
    }
}

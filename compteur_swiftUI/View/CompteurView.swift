//
//  CompteurView.swift
//  compteur_swiftUI
//
//  Created by Pierric Marye on 16/03/2022.
//

import SwiftUI
import AVKit

struct CompteurView: View {
    
    @EnvironmentObject private var compteurVM: CompteurViewModel
    
    @State var resetAlerte = false
    @State var alertNote = false
    @State var note1: String = ""
    
    let screenSize = UIScreen.main.bounds
    
    var body: some View {
        ZStack {
            compteurVM.arrierePlan.ignoresSafeArea()
            
            VStack(alignment: .center, spacing: 60.0) {
                VStack(alignment: .center, spacing: 15.0) {
                    counter
                    
                    categoriesAndPitch
                }
                .frame(width: screenSize.width * 0.75, height: screenSize.height * 0.25)
                .padding(15.0)
                .background(.regularMaterial)
                .cornerRadius(15)
                .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0, y: 0)
                
                usersActions
            }
            .padding()
            // de flouter la view ciblée; ici la scrollView
            .blur(radius: resetAlerte || alertNote ? 10 : 0)
            // modale style alert en arrière plan sera au premier plan sur appui du bouton "⟲"
            AlertResetCompteurView(resetAlerte1: $resetAlerte)
            AlertSauvegardeNoteView(alerteAjout2: $alertNote, note: $note1)
        }
    }
}

struct CompteurView_Previews: PreviewProvider {
    static var previews: some View {
        CompteurView()
            .environmentObject(CompteurViewModel())
    }
}

/* *************************************************************************************** */

extension CompteurView {
    // Counter
    private var counter: some View {
        Text(compteurVM.compteurEnCoursFormatte)
            .font(.system(size: 75, weight: .heavy, design: .rounded))
            .foregroundColor(compteurVM.arrierePlan)
    }
    
    // Categories and pitch
    private var categoriesAndPitch: some View {
        HStack(spacing: 5) {
            // Nom du type de choix sera passé à l'avenir
            
            Text("\(compteurVM.categoriePicker[compteurVM.indexSelectionne]) :")
                .font(.title2)
                .fontWeight(.heavy)
            
            // Choix du pas d'incrémentation à afficher selon paramètres
            Text("\(compteurVM.pasDuCompteur)")
                .font(.title2)
                .fontWeight(.heavy)
        }
        .foregroundColor(compteurVM.arrierePlan)
    }
    
    // Users Actions
    private var usersActions: some View {
        VStack(spacing: 20.0) {
            Spacer()
            
            HStack {
                // Boutons de comptage -
                Button {
                    compteurVM.decCompteur()
                    SoundManager.instance.jouerSon(son: "Click1")
                } label: {
                    Image(systemName:"minus.square")
                        .resizable()
                    // change la couleur de l'image
                        .frame(width: 60, height: 60)
                        .padding()
                }
                // Boutons de reset
                Button {
                    // appel des fonctions du compteurViewModel
                    withAnimation(.easeInOut) {
                        resetAlerte = true
                    }
                } label: {
                    Image(systemName: "arrow.counterclockwise.circle")
                        .resizable()
                    // change la couleur de l'image
                        .frame(width: 60, height: 60)
                        .padding()
                }
                
                // Boutons de comptage +
                Button {
                    compteurVM.incCompteur()
                    SoundManager.instance.jouerSon(son: "Click1")
                } label: {
                    Image(systemName:"plus.square")
                        .resizable()
                    // change la couleur de l'image
                        .frame(width: 60, height: 60)
                        .padding()
                }
            }
            .foregroundColor(compteurVM.arrierePlan)
            .padding(5.0)
            .background(.regularMaterial)
            .cornerRadius(15)
            
            Spacer()
            // Bouton sauvegarder
            Button(action: {
                withAnimation(.easeInOut) {
                    alertNote = true
                }
            }) {
                Text("Sauvegarder")
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
            }
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            .background(compteurVM.arrierePlan)
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.5), radius: 2, x: 2, y: 2)
            
            Spacer()
        }
        .foregroundColor(compteurVM.arrierePlan)
        .padding()
        .frame(width: screenSize.width * 0.9, height: screenSize.height * 0.4)
        .background(.thinMaterial)
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0, y: 0)
    }
}

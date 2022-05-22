//
//  TimerView.swift
//  compteur_swiftUI
//
//  Created by Pierric Marye on 21/05/2022.
//

import SwiftUI

struct TimerView: View {
    @EnvironmentObject var timerVM: TimerViewModel
    @EnvironmentObject var CompteurVM: CompteurViewModel
    
    var body: some View {
        ZStack {
            CompteurVM.arrierePlan
                .ignoresSafeArea()
            
            VStack {
                GeometryReader { proxy in
                    VStack(spacing: 25) {
                        /** Minuteur */
                        ZStack {
                            // Cercle prériphérique
                            Circle()
                                .fill(.ultraThinMaterial)
                                .blur(radius: 2)
                                .padding(-40)
                            
                            // Cercle central
                            Circle()
                                .fill(.thinMaterial)
                            
                            // Anneau de décompte
                            Circle()
                                .trim(from: 0, to: timerVM.progression)
                                .stroke(CompteurVM.arrierePlan, lineWidth: 10)
                                .shadow(color: .black.opacity(0.5), radius: 5, x: 0, y: 0)
                            
                            // Point de position du temps écoulé
                            GeometryReader { proxy in
                                let size = proxy.size
                                
                                Circle()
                                    .fill(.white)
                                    .frame(width: 30, height: 30)
                                    .overlay {
                                        Circle()
                                            .fill(CompteurVM.arrierePlan)
                                            .padding(5)
                                    }
                                    .frame(width: size.width, height: size.height, alignment: .center)
                                    .offset(x: size.height / 2)
                                    .rotationEffect(.init(degrees: timerVM.progression * 360))
                            }
                            
                            // Affichage du temps
                            Text(timerVM.timerString)
                                .font(.system(size: 45, weight: .heavy, design: .rounded))
                                .foregroundColor(CompteurVM.arrierePlan)
                                .rotationEffect(.init(degrees: 90))
                                .animation(.none, value: timerVM.progression)
                        }
                        .padding(60)
                        .frame(height: proxy.size.width)
                        .rotationEffect(.init(degrees: -90))
                        .animation(.easeInOut, value: timerVM.progression)
                        
                        // Bouton qui affiche la modale et stop la minuterie
                        Button {
                            if timerVM.timerDemarre {
                                timerVM.stopTimer()
                            } else {
                                withAnimation {
                                    timerVM.ajoutTimer = true
                                }
                            }
                        } label: {
                            Image(systemName: !timerVM.timerDemarre ? "hourglass.badge.plus" :  "stop.fill")
                                .font(.largeTitle.bold())
                                .foregroundColor(.white)
                                .frame(width: 75.0, height: 75.0)
                                .background(
                                    Circle()
                                        .fill(CompteurVM.arrierePlan)
                                        .shadow(color: .black.opacity(0.5), radius: 2, x: 0, y: 0)
                                )
                        }
                        
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    .shadow(radius: 5)
                }
            }
            .padding()
            .overlay(content: {
                /** Contient la modale des paramètres de réglages du temps*/
                ZStack {
                    // Couleur d'arrière plan de la modale
                    CompteurVM.arrierePlan
                        .opacity(timerVM.ajoutTimer ? 0.50 : 0)
                        .onTapGesture {
                            timerVM.heures = 0
                            timerVM.minutes = 0
                            timerVM.secondes = 0
                            withAnimation {
                                timerVM.ajoutTimer = false
                            }
                        }
                    
                    // Vue de la modale
                    nouveauTimer
                        .frame(maxHeight: .infinity, alignment: .bottom)
                        .offset(y: timerVM.ajoutTimer ? 0 : 400)
                }
            })
            .onReceive(Timer.publish(every: 1, on: .main, in: .common).autoconnect()) { _ in
                if timerVM.timerDemarre {
                    timerVM.updateTimer()
                }
            }
            .alert("Timer terminé", isPresented: $timerVM.timerTermine) {
                Button("Démarrer un nouveau timer", role: .cancel) {
                    timerVM.stopTimer()
                    timerVM.ajoutTimer = true
                    SoundManager.instance.arreterSon()
                }
                Button("Fermer", role: .destructive) {
                    timerVM.stopTimer()
                    SoundManager.instance.arreterSon()
                }
            }
        }
    }
    
    // Function pour générée une vue dans les boutons du choix du temps
    @ViewBuilder
    func ContextMenuOptions(valeurMax: Int, ref: String, onClick: @escaping (Int)->()) -> some View {
        ForEach(0...valeurMax, id: \.self) { valeur in
            Button("\(valeur) \(ref)") {
                onClick(valeur)
            }
        }
    }
}


/* * Vue modale paramètres *************************************************************** */

extension TimerView {
    private var nouveauTimer: some View {
        VStack(spacing: 25) {
            // Title
            Text("Ajouter une minuterie")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(CompteurVM.arrierePlan)
                .padding(.top, 10)
            
            // Cellules de réglages
            HStack(spacing: 15) {
                // Heures
                Text("\(timerVM.heures) hr")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.black.opacity(0.7))
                    .padding(.horizontal, 20.0)
                    .padding(.vertical, 12)
                    .background {
                        Capsule()
                            .fill(.white.opacity(0.5))
                    }
                // défini la vue Text() en bouton sélecteur avec la fonction ContextMenuOptions décrite plus bas
                    .contextMenu {
                        ContextMenuOptions(valeurMax: 12, ref: "hr") { valeur in
                            timerVM.heures = valeur
                        }
                    }
                
                // Minutes
                Text("\(timerVM.minutes) min")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.black.opacity(0.7))
                    .padding(.horizontal, 20.0)
                    .padding(.vertical, 12)
                    .background {
                        Capsule()
                            .fill(.white.opacity(0.5))
                    }
                // défini la vue Text() en bouton sélecteur avec la fonction ContextMenuOptions décrite plus bas
                    .contextMenu {
                        ContextMenuOptions(valeurMax: 60, ref: "min") { valeur in
                            timerVM.minutes = valeur
                        }
                    }
                
                // Secondes
                Text("\(timerVM.secondes) sec")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.black.opacity(0.7))
                    .padding(.horizontal, 20.0)
                    .padding(.vertical, 12)
                    .background {
                        Capsule()
                            .fill(.white.opacity(0.5))
                    }
                // défini la vue Text() en bouton sélecteur avec la fonction ContextMenuOptions décrite plus bas
                    .contextMenu {
                        ContextMenuOptions(valeurMax: 60, ref: "sec") { valeur in
                            timerVM.secondes = valeur
                        }
                    }
            }
            .padding(.top, 20)
            
            Button {
                timerVM.startTimer()
            } label: {
                Text("Démarrer")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.vertical)
                    .padding(.horizontal, 50)
                    .background {
                        Capsule()
                            .fill(CompteurVM.arrierePlan)
                    }
                    .shadow(color: .black.opacity(0.5), radius: 2, x: 2, y: 2)
            }
            .disabled(timerVM.secondes == 0 && timerVM.minutes == 0 && timerVM.heures == 0)
            .padding(.top)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background {
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(.regularMaterial)
                .ignoresSafeArea()
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
            .environmentObject(CompteurViewModel())
            .environmentObject(TimerViewModel())
    }
}

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
                    // Anneau du timer
                    VStack(spacing: 15) {
                        ZStack {
                            Circle()
                                .fill(.ultraThinMaterial)
                                .blur(radius: 3)
                                .padding(-25)
                            
                            Circle()
                                .fill(.regularMaterial)
                            
                            Circle()
                                .trim(from: 0, to: timerVM.progression)
                                .stroke(CompteurVM.arrierePlan, lineWidth: 10)
                            
                            GeometryReader { proxy in
                                let size = proxy.size
                                
                                Circle()
                                    .fill(.regularMaterial)
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
                        
                        Button {
                            if timerVM.timerDemarre {
                                timerVM.stopTimer()
                            } else {
                                withAnimation {
                                    timerVM.ajoutTimer = true
                                }
                            }
                        } label: {
                            Image(systemName: !timerVM.timerDemarre ? "timer" :  "stop.fill")
                                .font(.largeTitle.bold())
                                .foregroundColor(.white)
                                .frame(width: 75.0, height: 75.0)
                                .background(
                                    Circle()
                                        .fill(CompteurVM.arrierePlan)
                                )
                                .shadow(radius: 5)
                        }
                        
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    .shadow(radius: 5)
                }
            }
            .padding()
            .overlay(content: {
                ZStack {
                    CompteurVM.arrierePlan
                        .opacity(timerVM.ajoutTimer ? 0.25 : 0)
                        .onTapGesture {
                            timerVM.heures = 0
                            timerVM.minutes = 0
                            timerVM.secondes = 0
                            timerVM.ajoutTimer = false
                        }
                    
                    nouveauTimerView()
                        .frame(maxHeight: .infinity, alignment: .bottom)
                        .offset(y: timerVM.ajoutTimer ? 0 : 300)
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
                }
                Button("Fermer", role: .destructive) {
                    timerVM.stopTimer()
                }
            }
        }
    }
    /* * Vue modale paramètres *************************************************************** */
    
    // Vue Nouveau Timer
    func nouveauTimerView() -> some View {
        VStack(spacing: 15) {
            Text("Ajouter un timer")
                .font(.title2)
                .bold()
                .padding(.top, 10)
            
            // Cellules de réglages
            HStack(spacing: 15) {
                // Heures
                Text("\(timerVM.heures) hr")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.black.opacity(0.5))
                    .padding(.horizontal, 20.0)
                    .padding(.vertical, 12)
                    .background {
                        Capsule()
                            .fill(.white.opacity(0.5))
                    }
                    .contextMenu {
                        ContextMenuOptions(valeurMax: 12, ref: "hr") { valeur in
                            timerVM.heures = valeur
                        }
                    }
                
                // Minutes
                Text("\(timerVM.minutes) min")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.black.opacity(0.5))
                    .padding(.horizontal, 20.0)
                    .padding(.vertical, 12)
                    .background {
                        Capsule()
                            .fill(.white.opacity(0.5))
                    }
                    .contextMenu {
                        ContextMenuOptions(valeurMax: 60, ref: "min") { valeur in
                            timerVM.minutes = valeur
                        }
                    }
                
                // Secondes
                Text("\(timerVM.secondes) sec")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.black.opacity(0.5))
                    .padding(.horizontal, 20.0)
                    .padding(.vertical, 12)
                    .background {
                        Capsule()
                            .fill(.white.opacity(0.5))
                    }
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
                Text("sauvegarder")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.vertical)
                    .padding(.horizontal, 50)
                    .background {
                        Capsule()
                            .fill(CompteurVM.arrierePlan)
                    }
            }
            .disabled(timerVM.secondes == 0)
            .opacity(timerVM.secondes == 0 ? 0.5 : 1)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background {
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(.regularMaterial)
                .ignoresSafeArea()
        }
    }
    
    @ViewBuilder
    func ContextMenuOptions(valeurMax: Int, ref: String, onClick: @escaping (Int)->()) -> some View {
        ForEach(0...valeurMax, id: \.self) { valeur in
            Button("\(valeur) \(ref)") {
                onClick(valeur)
            }
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

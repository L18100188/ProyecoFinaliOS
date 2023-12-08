//
//  SoundMan.swift
//  proyectoFinal
//
//  Created by Luis Hernandez on 07/12/23.
//

import Foundation
import AVFoundation

class soundManager {
    static let instance = soundManager()
    var player: AVAudioPlayer?
    
    
    func playSound(){
        guard let soundURL = Bundle.main.url(forResource: "S2", withExtension: ".wav") else {return}
        
        do {
            player = try AVAudioPlayer(contentsOf: soundURL)
            player?.play()
            
        } catch {
            print("Error al reproducior sonido: \(error.localizedDescription)")
        }
    }
    
    func setVol(_ volumen: Float) {
        player?.volume = volumen
    }
    
    
}

class ExtendedSoundManager: soundManager {
    func changeVol(to volumen: Float) {
        player?.volume = volumen
    }
}


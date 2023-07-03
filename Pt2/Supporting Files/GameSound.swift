//
//  GameSound.swift
//  Pt1
//
//  Created by Mert Arıcan on 22.08.2021.
//

import Foundation
import AVFoundation

class GameSound {
    private static var soundPlayer: AVAudioPlayer!
    
    static func playTouch() { playSound(name: "Latest.m4a") }
    static var player: AVAudioPlayer?
    
    static func playSound(name: String) {
        
        guard let url = Bundle.main.url(forResource: "\(name)", withExtension: nil) else { return }
        do {
            try AVAudioSession.sharedInstance().setCategory(.ambient, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            DispatchQueue.global(qos: .userInitiated).async {
                /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
                player = try? AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
                
                guard let player = player else { return }
                player.numberOfLoops = -1
                player.play()
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
}

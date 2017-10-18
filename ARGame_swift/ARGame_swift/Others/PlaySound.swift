//
//  PlaySound.swift
//  ARGame_swift
//
//  Created by Dwt on 2017/10/18.
//  Copyright © 2017年 Dwt. All rights reserved.
//

import AVFoundation


func playSound(of effect: SoundEffects) {
    
    OperationQueue.main.addOperation {
        let player : AVAudioPlayer!
        if let url = Bundle.main.url(forResource: effect.rawValue, withExtension: "mp3"){
            player = try? AVAudioPlayer(contentsOf: url)
            player.play()
        }
    }
    
}

enum SoundEffects : String {
    case explosion = "explosion"
    case collision = "collision"
    case torpedo = "torpedo"
}

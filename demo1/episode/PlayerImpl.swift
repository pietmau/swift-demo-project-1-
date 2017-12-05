//
// Created by Maurizio Pietrantuono on 05/12/2017.
// Copyright (c) 2017 Maurizio Pietrantuono. All rights reserved.
//

import Foundation
import AVFoundation

class PlayerImpl: NSObject, Player, AVAudioPlayerDelegate {
    let audioPlayer: AVAudioPlayer?

    init(url: URL) {
        audioPlayer = try? AVAudioPlayer(contentsOf: url)
        super.init()
        audioPlayer?.delegate = self
        audioPlayer?.prepareToPlay()
    }

    func play() {
        audioPlayer?.play()
    }

    func pause(){
        audioPlayer?.pause()
    }

    func stop(){
        audioPlayer?.stop()
    }
}

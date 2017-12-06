//
// Created by Maurizio Pietrantuono on 05/12/2017.
// Copyright (c) 2017 Maurizio Pietrantuono. All rights reserved.
//

import Foundation
import AVFoundation

class PlayerImpl: NSObject, Player {
    private let audioPlayer: AVPlayer
    private var view: PlayerView?
    private var observer: Any? = nil
    var isPlaying: Bool {
        get {
            return (audioPlayer.rate != 0 && audioPlayer.error == nil)
        }
    }

    init(url: URL, view: PlayerView) {
        self.view = view
        audioPlayer = AVPlayer(url: url)
        super.init()
        addCallback()
    }

    private func addCallback() {
        let interval = CMTimeMake(1, 1)
        observer = audioPlayer.addPeriodicTimeObserver(forInterval: interval, queue: DispatchQueue.main, using: { time
        in
            self.calculateAndSetDurationAndProgress()
        })
    }

    private func calculateAndSetDurationAndProgress() {
        let duration = self.audioPlayer.currentItem?.duration.seconds
        let currrentTime = self.audioPlayer.currentTime().seconds
        let durationLabel = TimeLabel(duration)
        let currrentTimeLabel = TimeLabel(currrentTime)
        let currentTimeInPercent = calculatePercentage(duration, currrentTime)
        view?.onTimeUpdate(duration: durationLabel, position: currrentTimeLabel, progress: currentTimeInPercent)
    }

    private func calculatePercentage(_ duration: Double?, _ time: Double?) -> Double {
        if (duration?.isNaN != false || time?.isNaN != false) {
            return 50.0 / 100.0
        }
        return (time! / duration!) * 100
    }

    func play() {
        audioPlayer.play()
    }

    func pause() {
        audioPlayer.pause()
    }

    func stop() {
        if let observer = observer {
            audioPlayer.removeTimeObserver(observer)
        }
        audioPlayer.replaceCurrentItem(with: nil)
    }

    func seekTo(_ value: Float) {
        if var duration = self.audioPlayer.currentItem?.duration.seconds {
            duration = duration * Double(value) / 100
            let time = CMTime(seconds: duration, preferredTimescale: 1)
            audioPlayer.seek(to: time)
        }
    }
}


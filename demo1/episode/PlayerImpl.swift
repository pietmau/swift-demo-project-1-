//
// Created by Maurizio Pietrantuono on 05/12/2017.
// Copyright (c) 2017 Maurizio Pietrantuono. All rights reserved.
//

import Foundation
import AVFoundation

class PlayerImpl: NSObject, Player {
    private let audioPlayer: AVPlayer
    private var callback: PlayerCallback?
    private var observer: Any? = nil
    var isPlaying: Bool {
        get {
            return (audioPlayer.rate != 0 && audioPlayer.error == nil)
        }
    }
    var hasEnded: Bool = false

    init(url: URL, callback: PlayerCallback) {
        self.callback = callback
        audioPlayer = AVPlayer(url: url)
        super.init()
        addCallback()
    }

    private func addCallback() {
        let interval = CMTimeMake(1, 1)
        observer = audioPlayer.addPeriodicTimeObserver(forInterval: interval, queue: DispatchQueue.main, using: { _ in
            self.calculateAndSetDurationAndProgress()
        })
        NotificationCenter.default.addObserver(self, selector: #selector(self.playerDidFinishPlaying(note:)),
                name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: audioPlayer.currentItem)
    }

    @objc
    func playerDidFinishPlaying(note: NSNotification) {
        hasEnded = true
        callback?.onPlaybackEnded()
    }

    private func calculateAndSetDurationAndProgress() {
        let duration = self.audioPlayer.currentItem?.duration.seconds
        let currrentTime = self.audioPlayer.currentTime().seconds
        let durationLabel = TimeLabel(duration)
        let currrentTimeLabel = TimeLabel(currrentTime)
        let currentTimeInPercent = calculatePercentage(duration, currrentTime)
        callback?.onTimeUpdate(duration: durationLabel, position: currrentTimeLabel, progress: currentTimeInPercent)
    }

    private func calculatePercentage(_ duration: Double?, _ time: Double?) -> Double {
        if (duration?.isNaN != false || time?.isNaN != false) {
            return 50.0 / 100.0
        }
        return (time! / duration!) * 100
    }

    func play() {
        hasEnded = false
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

    func restart() {
        seekTo(0)
        audioPlayer.play()
    }
}


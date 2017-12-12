import Foundation
import AVFoundation

class PlayerImpl: NSObject, Player {
    private let audioPlayer: AVPlayer
    private var view: PlayerView?
    private var observer: Any? = nil
    private let progressInfoCreator: ProgressInfoCreator = ProgressInfoCreator()
    private var hasEnded: Bool = false

    init(url: URL, view: PlayerView) {
        self.view = view
        audioPlayer = AVPlayer(url: url)
        super.init()
        addCallback()
    }

    private func addCallback() {
        let interval = CMTimeMake(1, 1)
        observer = audioPlayer.addPeriodicTimeObserver(forInterval: interval, queue: DispatchQueue.main, using: { _ in
            self.calculateState()
        })
        NotificationCenter.default.addObserver(self, selector: #selector(self.playerDidFinishPlaying(note:)), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: audioPlayer.currentItem)
    }

    func onPlayPauseClicked() {
        if isPlaying() {
            pause()
            return
        }
        if (hasEnded == true) {
            restart()
            return
        }
        play()
    }

    private func isPlaying() -> Bool {
        return audioPlayer.rate == 1 && audioPlayer.error == nil
    }

    @objc
    func playerDidFinishPlaying(note: NSNotification) {
        hasEnded = true
        view?.showRestart()
    }

    private func calculateState() {
        if (audioPlayer.rate != 0.0) {
            onPlayerPlaying()
            return
        }
        if (audioPlayer.rate == 0.0) {
            onPlayerNotPlaying()
            return
        }
    }

    private func onPlayerNotPlaying() {
        if (audioPlayer.error == nil) {
            onPause()
            return
        }
        onError()
    }

    private func onError() {
    }

    private func onPause() {
        view?.showPlay()
    }

    private func onPlayerPlaying() {
        hasEnded = false
        if let item = self.audioPlayer.currentItem {
            if (item.isPlaybackLikelyToKeepUp) {
                onActuallyPlaying(item)
                return
            }
            if (item.isPlaybackBufferEmpty) {
                onBuffering()
                return
            }
        }
    }

    private func onBuffering() {
        view?.onBuffering()
    }

    private func onActuallyPlaying(_ item: AVPlayerItem) {
        view?.onTimeUpdate(progress: progressInfoCreator.createProgressInfo(item))
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

    func restart() {
        seekTo(0)
        audioPlayer.play()
    }
}


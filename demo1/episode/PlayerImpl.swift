import Foundation
import AVFoundation

class PlayerImpl: NSObject, Player, PlayeStateCallback {
    let audioPlayer: AVPlayer
    private var view: PlayerView?
    private var observer: Any? = nil
    private let progressInfoCreator: ProgressInfoCreator = ProgressInfoCreator()
    private let stateCalculator: StateCalculator = StateCalculator()

    init(url: URL, view: PlayerView) {
        self.view = view
        audioPlayer = AVPlayer(url: url)
        super.init()
        stateCalculator.setCallback(self)
        addCallback()
    }

    private func addCallback() {
        observer = audioPlayer.addPeriodicTimeObserver(forInterval: CMTimeMake(1, 1), queue: DispatchQueue.main, using: { _ in
            self.calculateState()
        })
        NotificationCenter.default.addObserver(self, selector: #selector(self.playerDidFinishPlaying(note:)), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: audioPlayer.currentItem)
    }

    func onPlayPauseClicked() {
        stateCalculator.onPlayPauseClicked()
    }

    @objc
    func playerDidFinishPlaying(note: NSNotification) {
        stateCalculator.playerDidFinishPlaying()
        view?.hidePleaseWait(hide: true)
        view?.showRestart()
    }

    private func calculateState() {
        stateCalculator.calculateState()
    }

    internal func onError() {
        view?.hidePleaseWait(hide: true)
    }

    internal func onPause() {
        view?.hidePleaseWait(hide: true)
        view?.showPlay()
    }

    internal func onBuffering() {
        view?.hidePleaseWait(hide: false)
    }

    internal func onActuallyPlaying(_ item: AVPlayerItem) {
        view?.hidePleaseWait(hide: true)
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


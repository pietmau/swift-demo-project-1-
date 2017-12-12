import Foundation
import AVKit

class StateCalculator {
    private var player: PlayeStateCallback? = nil
    private var hasEnded: Bool = false

    func setCallback(_ player: PlayeStateCallback) {
        self.player = player
    }

    func calculateState() {
        print("calculateState")
        if (player?.audioPlayer.rate != 0.0) {
            onPlayerPlaying()
            return
        }
        if (player?.audioPlayer.rate == 0.0) {
            onPlayerNotPlaying()
            return
        }
    }

    private func onPlayerPlaying() {
        print("onPlayerPlaying")
        hasEnded = false
        if let item = player?.audioPlayer.currentItem {
            if (item.isPlaybackLikelyToKeepUp) {
                print("onActuallyPlaying")
                player?.onActuallyPlaying(item)
                return
            }
            if (item.isPlaybackBufferEmpty) {
                print("onBuffering")
                player?.onBuffering()
                return
            }
        }
    }

    private func onPlayerNotPlaying() {
        print("onPlayerNotPlaying")
        if (player?.audioPlayer.error == nil) {
            player?.onPause()
            return
        }
        player?.onError()
    }

    func onPlayPauseClicked() {
        if isPlaying() {
            player?.pause()
            return
        }
        if (hasEnded == true) {
            player?.restart()
            return
        }
        player?.play()
    }

    func playerDidFinishPlaying() {
        hasEnded = true
    }

    private func isPlaying() -> Bool {
        return player?.audioPlayer.rate == 1 && player?.audioPlayer.error == nil
    }
}

protocol PlayeStateCallback {

    func play()

    func restart()

    func pause()

    func onError()

    func onPause()

    func onBuffering()

    func onActuallyPlaying(_ item: AVPlayerItem)

    var audioPlayer: AVPlayer { get }

}
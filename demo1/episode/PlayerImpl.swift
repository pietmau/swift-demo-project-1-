import Foundation
import AVFoundation
import MediaPlayer
import FeedKit

class PlayerImpl: NSObject, Player, PlayeStateCallback {
    internal let audioPlayer: AVPlayer
    private var view: PlayerView?
    private var feed: RSSFeedItem?
    private var imageUrl: URL?
    private var observer: Any? = nil
    private let progressInfoCreator: ProgressInfoCreator = ProgressInfoCreator()
    private let stateCalculator: StateCalculator = StateCalculator()

    private static let INSTANCE: Player = PlayerImpl()

    func start(feed: RSSFeedItem?, view: PlayerView, imageUrl: URL?) {
        self.imageUrl = imageUrl
        self.view = view
        self.feed = feed
        if let feed = feed, let feedUrl = feed.enclosure?.attributes?.url, let audioUrl = URL(string: feedUrl) {
            let playerItem = AVPlayerItem(url: audioUrl)
            audioPlayer.replaceCurrentItem(with: playerItem)
        }
    }

    static func getInstance() -> Player {
        return PlayerImpl.INSTANCE
    }

    override private init() {
        audioPlayer = AVPlayer()
        super.init()
        stateCalculator.setCallback(self)
        addCallback()
        setupRemoteTransportControls()
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
        updateNowPlaying()
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

    func setupRemoteTransportControls() {
        let commandCenter = MPRemoteCommandCenter.shared()
        commandCenter.playCommand.addTarget { [unowned self] event in
            if self.audioPlayer.rate == 0.0 {
                self.audioPlayer.play()
                return .success
            }
            return .commandFailed
        }
        commandCenter.pauseCommand.addTarget { [unowned self] event in
            if self.audioPlayer.rate == 1.0 {
                self.audioPlayer.pause()
                return .success
            }
            return .commandFailed
        }
    }

    func updateNowPlaying() {
        print("in " + String(Date.timeIntervalSinceReferenceDate))
        DispatchQueue.global(qos: .utility).async { () -> Void in
            print("start " + String(Date.timeIntervalSinceReferenceDate))
            var nowPlayingInfo = [String: Any]()

            if let image = UIImage(named: "lockscreen") {
                nowPlayingInfo[MPMediaItemPropertyArtwork] = MPMediaItemArtwork(boundsSize: image.size) { size in
                    return image
                }
            }
            nowPlayingInfo[MPNowPlayingInfoPropertyElapsedPlaybackTime] = self.audioPlayer.currentItem?.currentTime().seconds
            nowPlayingInfo[MPMediaItemPropertyPlaybackDuration] = self.audioPlayer.currentItem?.asset.duration.seconds
            nowPlayingInfo[MPNowPlayingInfoPropertyPlaybackRate] = self.audioPlayer.rate
            if let feed = self.feed {
                nowPlayingInfo[MPMediaItemPropertyTitle] = feed.title
            }
            if let imageUrl = self.imageUrl, let data = try? Data(contentsOf: imageUrl), let image = UIImage(data: data) {
                nowPlayingInfo[MPMediaItemPropertyArtwork] = MPMediaItemArtwork(image: image)
            }
            MPNowPlayingInfoCenter.default().nowPlayingInfo = nowPlayingInfo
            print("finish " + String(Date.timeIntervalSinceReferenceDate))
        }
        print("out " + String(Date.timeIntervalSinceReferenceDate))
    }
}


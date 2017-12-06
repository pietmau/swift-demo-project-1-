//
//  EpisodeViewController.swift
//  demo1
//
//  Created by Maurizio Pietrantuono on 01/12/2017.
//  Copyright © 2017 Maurizio Pietrantuono. All rights reserved.
//

import UIKit
import FeedKit
import Kingfisher
import AVKit

class EpisodeViewController: UIViewController, PlayerView {
    @IBOutlet var image: UIImageView!
    @IBOutlet weak var slider: UISlider!

    @IBOutlet weak var duration: UILabel!
    @IBOutlet weak var length: UILabel!
    @IBOutlet weak var playPauseButton: UIButton!

    var feedItem: RSSFeedItem? = nil
    var imageUrl: URL? = nil
    var player: Player? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        if let imageUrl = imageUrl {
            image.kf.setImage(with: imageUrl)
        }
        if let episodeTitle = feedItem?.title {
            title = episodeTitle
        }
        initPlayer()
    }

    private func initPlayer() {
        if let feedUrl = feedItem?.enclosure?.attributes?.url, let audioUrl = URL(string: feedUrl) {
            player = PlayerImpl(url: audioUrl, view: self)
            player?.play()
        }
    }

    func onTimeUpdate(duration: TimeLabel, position: TimeLabel, progress: Double) {
        self.duration.text = duration.description
        self.length.text = position.description
        slider.value = Float(progress)
        if (playerIsPlaying()) {
            setButtonPlaying()
        }
    }

    override func viewDidDisappear(_ animated: Bool) {
        player?.stop()
    }

    @IBAction func onPlayPauseClicked(_ sender: UIButton) {
        if playerIsPlaying() {
            pause()
            return
        }
        play()
    }

    private func play() {
        player?.play()
        setButtonPlaying()
    }

    private func pause() {
        player?.pause()
        playPauseButton.setImage(#imageLiteral(resourceName:"play-256"), for: .normal)
    }

    private func playerIsPlaying() -> Bool {
        return player?.isPlaying == true
    }

    private func setButtonPlaying() {
        playPauseButton.setImage(#imageLiteral(resourceName:"white-pause-512"), for: .normal)
    }

    @IBAction func onSlide(_ sender: UISlider) {

    }
}

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
    @IBOutlet weak var pleaseWait: UIActivityIndicatorView!

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
        pleaseWait.startAnimating()
        initPlayer()
    }

    private func initPlayer() {
        if let feedUrl = feedItem?.enclosure?.attributes?.url, let audioUrl = URL(string: feedUrl) {
            player = PlayerImpl(url: audioUrl, view: self)
        }
    }

    @IBAction func onSlide(_ sender: UISlider) {
        player?.seekTo(sender.value)
    }

    func onTimeUpdate(progress: ProgressInfo) {
        self.duration.text = progress.durationLabel.description
        self.length.text = progress.currrentTimeLabel.description
        slider.value = Float(progress.currentTimeInPercent)
        showPauseButton()
    }

    @IBAction func onPlayPauseClicked(_ sender: UIButton) {
        player?.onPlayPauseClicked()
    }

    public func showPlay() {
        playPauseButton.setImage(#imageLiteral(resourceName:"play-256"), for: .normal)
    }

    public func showPauseButton() {
        playPauseButton.setImage(#imageLiteral(resourceName:"white-pause-512"), for: .normal)
    }

    public func showRestart() {
        playPauseButton.setImage(#imageLiteral(resourceName:"restart"), for: .normal)
    }

    public func hidePleaseWait(hide: Bool) {
        pleaseWait.isHidden = hide
    }


}

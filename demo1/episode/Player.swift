//
// Created by Maurizio Pietrantuono on 05/12/2017.
// Copyright (c) 2017 Maurizio Pietrantuono. All rights reserved.
//

import Foundation
import FeedKit

protocol Player {

    func start(feed: RSSFeedItem?, view: PlayerView, imageUrl: URL?)

    func onPlayPauseClicked()

    func play()

    func pause()

    func stop()

    func seekTo(_ value: Float)

    func restart()

}

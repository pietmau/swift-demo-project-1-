//
// Created by Maurizio Pietrantuono on 29/11/2017.
// Copyright (c) 2017 Maurizio Pietrantuono. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher
import FeedKit

class EpisodeCell: UITableViewCell {
    @IBOutlet weak var podcastImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var desctiptionItem: UILabel!

    func bind(_ element: FeedKit.RSSFeedItem) {
        titleLabel.text = element.title
        desctiptionItem.text = element.description
        if let url = getThumbnailUrl(element) {
            podcastImage.kf.setImage(with: url)
        } else {
            podcastImage.image = UIImage(named: "no-no-no-thumbnail-here.jpg")
        }
    }

    private func getThumbnailUrl(_ element: RSSFeedItem) -> URL? {
        if let url = getThumbnailUrlFromMedia(element) {
            return url
        }
        if let url = getThumbnailUrlFromItunes(element) {
            return url
        }
        return nil
    }

    private func getThumbnailUrlFromMedia(_ element: RSSFeedItem?) -> URL? {
        guard let thumbnails = element?.media?.mediaThumbnails, !thumbnails.isEmpty else {
            return nil
        }
        if let url = thumbnails[0].attributes?.url {
            return URL(string: url)
        }
        return nil
    }

    private func getThumbnailUrlFromItunes(_ element: RSSFeedItem?) -> URL? {
        guard let itunes = element?.iTunes, let url = itunes.iTunesImage?.attributes?.href else {
            return nil
        }
        return URL(string: url)
    }
}

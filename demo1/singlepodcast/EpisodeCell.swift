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

    func bind(_ element: FeedKit.RSSFeedItem, _ podcastUrl: URL?) {
        titleLabel.text = element.title
        desctiptionItem.text = element.description
        if let url = getThumbnailUrl(element, podcastUrl) {
            podcastImage.kf.setImage(with: url)
        } else {
            podcastImage.image = UIImage(named: "no-no-no-thumbnail-here.jpg")
        }
    }

}
 

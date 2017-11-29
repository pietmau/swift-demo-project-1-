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
        //podcastImage.kf(URL(element.))
    }
}

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

class EpisodeViewController: UIViewController {

    @IBOutlet var image: UIImageView!
    var feedItem: RSSFeedItem? = nil
    var imageUrl: URL? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        if let imageUrl = imageUrl {
            image.kf.setImage(with:imageUrl)
        }
    }


}

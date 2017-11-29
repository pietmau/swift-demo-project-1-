//
// Created by Maurizio Pietrantuono on 28/11/2017.
// Copyright (c) 2017 Maurizio Pietrantuono. All rights reserved.
//

import Foundation
import UIKit

class SinglePodcastController: UIViewController {
    //@IBOutlet weak var episodesCollectionView: UICollectionView!
    @IBOutlet weak var controllerTitle: UINavigationItem!
    @IBOutlet weak var image: UIImageView!
    var podcast: Result? = nil
    let episodesDelegate = EpisodesListDelegate()

    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        if let artworkUrl100 = podcast?.artworkUrl100 {
            let url = URL(string: artworkUrl100)
            image.kf.setImage(with: url)
        }
        if let podcastTitle = podcast?.collectionName {
            controllerTitle.title = podcastTitle
        }
        //episodesCollectionView.delegate = episodesDelegate
        //episodesDelegate.items = podcast.
    }
}

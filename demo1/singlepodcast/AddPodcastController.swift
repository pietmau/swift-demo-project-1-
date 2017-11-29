//
// Created by Maurizio Pietrantuono on 28/11/2017.
// Copyright (c) 2017 Maurizio Pietrantuono. All rights reserved.
//

import Foundation
import UIKit
import FeedKit

class SinglePodcastController: UIViewController {
    @IBOutlet weak var episodesTableView: UITableView!
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
            image.kf.setImage(with: URL(string: artworkUrl100))
        }
        if let podcastTitle = podcast?.collectionName {
            controllerTitle.title = podcastTitle
        }
        if let urlString = podcast?.feedUrl, let url = URL(string: urlString) {
            FeedParser(URL: url)?.parseAsync(queue: DispatchQueue.global(qos: .userInitiated)) { (result) in
                DispatchQueue.main.async {
                    if let items = result.rssFeed?.items, !items.isEmpty {
                        self.episodesDelegate.items = items
                        self.episodesTableView.reloadData()
                    }

                }
            }
        }
        episodesTableView.delegate = episodesDelegate
        episodesTableView.dataSource = episodesDelegate
    }

    private func fff() {


    }
}

//
// Created by Maurizio Pietrantuono on 28/11/2017.
// Copyright (c) 2017 Maurizio Pietrantuono. All rights reserved.
//

import Foundation
import UIKit
import FeedKit

class SinglePodcastController: UIViewController, EpisodesListDlegateCallback {
    @IBOutlet weak var activtyIndicator: UIActivityIndicatorView!
    @IBOutlet weak var brian: UIView!
    @IBOutlet weak var episodesTableView: UITableView!
    @IBOutlet weak var image: UIImageView!
    var podcast: Result? = nil
    var episodesDelegate: EpisodesListDelegate? = nil

    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        episodesDelegate = EpisodesListDelegate(callback: self)
        setViewState(State.LOADING)
        if let artworkUrl100 = podcast?.artworkUrl100 {
            image.kf.setImage(with: URL(string: artworkUrl100))
        }
        if let podcastTitle = podcast?.collectionName {
            title = podcastTitle
        }
        if let urlString = podcast?.feedUrl, let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: URLRequest(url: url), completionHandler:
            { (data, response, error) in
                guard let data = data else {
                    self.setViewState(State.EMPTY)
                    return
                }
                self.getData(data: data)
            }).resume()
        } else {
            self.setViewState(State.EMPTY)
        }
        episodesTableView.delegate = episodesDelegate!
        episodesTableView.dataSource = episodesDelegate!
    }

    private func getData(data: Data) {
        FeedParser(data: data)?.parseAsync() { (result) in
            self.onResult(result: result)
        }
    }

    private func onResult(result: FeedKit.Result) {
        DispatchQueue.main.async {
            if let items = result.rssFeed?.items, !items.isEmpty {
                self.episodesDelegate!.items = items
                self.episodesTableView.reloadData()
                self.setViewState(State.FULL)
                return
            }
            self.setViewState(State.EMPTY)
        }
    }

    private func setViewState(_ state: SinglePodcastController.State) {
        switch (state) {
        case State.EMPTY:
            activtyIndicator.isHidden = true
            episodesTableView.isHidden = true
            brian.isHidden = false
            return
        case State.LOADING:
            activtyIndicator.isHidden = false
            episodesTableView.isHidden = true
            brian.isHidden = true
            return
        case State.FULL:
            activtyIndicator.isHidden = true
            episodesTableView.isHidden = false
            brian.isHidden = true
            return
        }
    }

    func onEpisodeSelected(_ element: RSSFeedItem) {
        let detailVc = self.storyboard!.instantiateViewController(withIdentifier: "EpisodeViewController") as! EpisodeViewController
        self.navigationController!.pushViewController(detailVc, animated: true)
    }

    func bar(){}
    
    enum State {
        case LOADING
        case EMPTY
        case FULL

    }
}

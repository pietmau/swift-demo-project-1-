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
    var podcast: Podcast? = nil
    var episodesDelegate: EpisodesListDelegate? = nil
    let saver = DataManagerCoreData.INSTANCE

    @IBAction func onAddClicked(_ sender: Any) {
        saver.savePodcast(podcast)
    }

    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareViews(podcastImageUrl: getPodcastImageUrl())
        setDelegates(podcastImageUrl: getPodcastImageUrl())
        getFeedAsync()
    }

    private func getFeedAsync() {
        if let urlString = podcast?.feedUrl, let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: URLRequest(url: url), completionHandler:
            { (data, response, error) in
                guard let data = data else {
                    self.setViewState(SinglePodcastViewState.EMPTY)
                    return
                }
                self.getData(data: data)
            }).resume()
        } else {
            self.setViewState(SinglePodcastViewState.EMPTY)
        }
    }

    private func setDelegates(podcastImageUrl: URL?) {
        episodesDelegate = EpisodesListDelegate(callback: self, podcastImageUrl)
        episodesTableView.delegate = episodesDelegate!
        episodesTableView.dataSource = episodesDelegate!
    }

    private func prepareViews(podcastImageUrl: URL?) {
        setViewState(SinglePodcastViewState.LOADING)
        image.kf.setImage(with: podcastImageUrl)
        if let podcastTitle = podcast?.collectionName {
            title = podcastTitle
        }
    }

    private func getPodcastImageUrl() -> URL? {
        var podcastImageUrl: URL? = nil
        if let artworkUrl100 = podcast?.artworkUrl100 {
            podcastImageUrl = URL(string: artworkUrl100)
        }
        return podcastImageUrl
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
                self.setViewState(SinglePodcastViewState.FULL)
                return
            }
            self.setViewState(SinglePodcastViewState.EMPTY)
        }
    }

    func setViewState(_ state: SinglePodcastViewState) {
        switch (state) {
        case SinglePodcastViewState.EMPTY:
            activtyIndicator.isHidden = true
            episodesTableView.isHidden = true
            brian.isHidden = false
            return
        case SinglePodcastViewState.LOADING:
            activtyIndicator.isHidden = false
            episodesTableView.isHidden = true
            brian.isHidden = true
            return
        case SinglePodcastViewState.FULL:
            activtyIndicator.isHidden = true
            episodesTableView.isHidden = false
            brian.isHidden = true
            return
        }
    }

    func onEpisodeSelected(_ element: RSSFeedItem) {
        let detailVc = self.storyboard!.instantiateViewController(withIdentifier: "EpisodeViewController") as! EpisodeViewController
        detailVc.feedItem = element
        if let imageUrl = podcast?.artworkUrl600 {
            detailVc.imageUrl = getThumbnailUrl(element, URL(string: imageUrl))
        }
        self.navigationController!.pushViewController(detailVc, animated: true)
    }
}

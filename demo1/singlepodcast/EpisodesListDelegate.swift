import Foundation
import UIKit
import FeedKit

class EpisodesListDelegate: NSObject, UITableViewDelegate, UITableViewDataSource {
    var items: [RSSFeedItem] = []
    let callback: EpisodesListDlegateCallback
    private var podcastUrl: URL? = nil

    init(callback: EpisodesListDlegateCallback, _  podcastUrl: URL?) {
        self.callback = callback
        self.podcastUrl = podcastUrl
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeItem",
                for: indexPath) as! EpisodeCell
        cell.bind(items[indexPath.row], podcastUrl)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85.0;
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        callback.onEpisodeSelected(items[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }

}

protocol EpisodesListDlegateCallback {
    func onEpisodeSelected(_ element: RSSFeedItem)
}

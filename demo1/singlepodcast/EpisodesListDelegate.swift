import Foundation
import UIKit
import FeedKit

class EpisodesListDelegate: NSObject, UITableViewDelegate, UITableViewDataSource {
    var items: [RSSFeedItem] = []

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeItem",
                for: indexPath) as! EpisodeCell
        cell.bind(items[indexPath.row])
        return cell
    }


}

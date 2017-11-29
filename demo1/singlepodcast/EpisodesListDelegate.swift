import Foundation
import UIKit
import FeedKit

class EpisodesListDelegate: NSObject, UICollectionViewDelegate, UICollectionViewDataSource {

    var items: [RSSFeedItem] = []

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "",
                for: indexPath)
        cell.backgroundColor = UIColor.black
        // Configure the cell
        return cell
    }
}

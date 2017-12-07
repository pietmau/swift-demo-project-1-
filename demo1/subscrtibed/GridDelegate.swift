import Foundation
import UIKit
import CoreData

class SubscribedGridDelegate: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    let SPACING = CGFloat(3)
    let CELL_NAME = "RearchResultCell"
    var results: NSFetchedResultsController<Podcast>? = nil
    var callback: OnItemClickedCallback? = nil

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return results.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CELL_NAME, for: indexPath) as! GridCell
        cell.setResult(results[indexPath.row])
        return cell
    }


    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        callback?.onItemClicked(results[indexPath.row])
    }
}


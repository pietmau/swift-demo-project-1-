import Foundation
import UIKit
import CoreData

class SubscribedGridDelegate: NSObject, UICollectionViewDelegate, UICollectionViewDataSource {
    let SPACING = CGFloat(3)
    let CELL_NAME = "RearchResultCell"
    var results: NSFetchedResultsController<PodcastCoreData>
    var callback: OnItemClickedCallback? = nil

    override init() {
        let context = DataManagerCoreData.INSTANCE.context
        let request: NSFetchRequest<PodcastCoreData> = PodcastCoreData.fetchRequest()
        results = NSFetchedResultsController(fetchRequest: request, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        do {
            try
            results.performFetch()
        } catch {
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return getFetchedObjects().count
    }

    private func getFetchedObjects() -> [PodcastCoreData] {
        return ((results.fetchedObjects != nil) ? results.fetchedObjects! : [])
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CELL_NAME, for: indexPath) as! GridCell
        cell.setResult(getFetchedObjects()[indexPath.row])
        return cell
    }


    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        callback?.onItemClicked(getFetchedObjects()[indexPath.row])
    }
}

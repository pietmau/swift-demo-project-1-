import Foundation
import UIKit

class GridDelegate: UIViewController, UICollectionViewDataSource  {
    let CELL_NAME = "RearchResultCell"
    var results: [Results] = []

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return results.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CELL_NAME, for: indexPath) as! GridCell
        cell.setResult(results[indexPath.row])
        return cell
    }
    
}

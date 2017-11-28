//
// Created by Maurizio Pietrantuono on 27/11/2017.
// Copyright (c) 2017 Maurizio Pietrantuono. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class GridCell: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView!
    var serchresullt: Results? = nil

    func setResult(_ element: Results) {
        self.serchresullt = element
        if let url60 = element.artworkUrl100 {
            let url = URL(string: url60)
            image.kf.setImage(with: url)
        }
    }
}

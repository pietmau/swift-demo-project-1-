//
// Created by Maurizio Pietrantuono on 27/11/2017.
// Copyright (c) 2017 Maurizio Pietrantuono. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class GridCell: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView!
    var serchresullt: Podcast? = nil

    func setResult(_ podcast: Podcast) {
        self.serchresullt = podcast
        if let url60 = podcast.artworkUrl100 {
            let url = URL(string: url60)
            image.kf.setImage(with: url)
        }
    }
}

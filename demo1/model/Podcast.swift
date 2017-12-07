//
// Created by Maurizio Pietrantuono on 07/12/2017.
// Copyright (c) 2017 Maurizio Pietrantuono. All rights reserved.
//

import Foundation

protocol Podcast {
    var artworkUrl100: String? { get }
    var trackName: String? { get }
    var feedUrl: String? { get }
    var collectionName: String? { get }
    var artworkUrl600: String? { get }
    var trackId: Int64 {get }
}

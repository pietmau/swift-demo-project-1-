//
// Created by Maurizio Pietrantuono on 01/12/2017.
// Copyright (c) 2017 Maurizio Pietrantuono. All rights reserved.
//

import Foundation
import FeedKit

public func getThumbnailUrl(_ element: RSSFeedItem, _ podcastUrl: URL?) -> URL? {
    if let url = getThumbnailUrlFromMedia(element) {
        return url
    }
    if let url = getThumbnailUrlFromItunes(element) {
        return url
    }
    return podcastUrl
}

private func getThumbnailUrlFromMedia(_ element: RSSFeedItem?) -> URL? {
    guard let thumbnails = element?.media?.mediaThumbnails, !thumbnails.isEmpty else {
        return nil
    }
    if let url = thumbnails[0].attributes?.url {
        return URL(string: url)
    }
    return nil
}

private func getThumbnailUrlFromItunes(_ element: RSSFeedItem?) -> URL? {
    guard let itunes = element?.iTunes, let url = itunes.iTunesImage?.attributes?.href else {
        return nil
    }
    return URL(string: url)
}
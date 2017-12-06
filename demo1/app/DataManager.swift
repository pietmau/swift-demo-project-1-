//
// Created by Maurizio Pietrantuono on 06/12/2017.
// Copyright (c) 2017 Maurizio Pietrantuono. All rights reserved.
//

import Foundation

protocol DataManager {
    func save()

    func loadSubscribedFeeds() -> [RssFeedCoreData]
}

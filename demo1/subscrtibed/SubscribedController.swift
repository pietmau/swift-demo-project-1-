//
// Created by Maurizio Pietrantuono on 06/12/2017.
// Copyright (c) 2017 Maurizio Pietrantuono. All rights reserved.
//

import Foundation
import UIKit

class SubscribedController: UIViewController {
    let dataManager = DataManagerCoreData.INSTANCE
    var feeds: [RssFeedCoreData]? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        feeds = dataManager.loadSubscribedFeeds()
        foo()
    }

    private func foo() {

    }
}

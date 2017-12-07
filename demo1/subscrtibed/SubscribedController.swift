//
// Created by Maurizio Pietrantuono on 06/12/2017.
// Copyright (c) 2017 Maurizio Pietrantuono. All rights reserved.
//

import Foundation
import UIKit

class SubscribedController: UIViewController, OnItemClickedCallback {
    let dataManager = DataManagerCoreData.INSTANCE
    var feeds: [PodcastCoreData]? = nil
    let SPACING = CGFloat(3)
    @IBOutlet weak var grid: UICollectionView!
    private let delegate: GridDelegate = GridDelegate()
    var controller: UINavigationController? = nil
    var singlePodcastController: SinglePodcastController? = nil

    func setResults(_ results: [Podcast]) {
        (grid?.dataSource as? GridDelegate)?.results = results
        grid.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate.callback = self
        grid?.dataSource = delegate
        grid?.delegate = delegate
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("viewWillLayoutSubviews")
        grid.collectionViewLayout.invalidateLayout()
    }

    override func viewWillAppear(_ animated: Bool) {
        setResults(dataManager.loadSubscribedFeeds() as [Podcast])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func onItemClicked(_ podcast: Podcast) {

    }
}

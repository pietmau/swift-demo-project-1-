//
//  GridViewController.swift
//  demo1
//
//  Created by Maurizio Pietrantuono on 28/11/2017.
//  Copyright © 2017 Maurizio Pietrantuono. All rights reserved.
//

import UIKit

class GridViewController: UIViewController, OnItemClickedCallback {
    let SPACING = CGFloat(3)
    @IBOutlet weak var grid: UICollectionView!
    private let delegate: GridDelegate = GridDelegate()

    func setResults(_ results: [Results]) {
        (grid?.dataSource as? GridDelegate)?.results = results
        grid.reloadData()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("viewWillLayoutSubviews")
        grid.collectionViewLayout.invalidateLayout()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate.callback = self
        grid?.dataSource = delegate
        grid?.delegate = delegate
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func onItemClicked(_ element: Results) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "SinglePodcast") as! SinglePodcastController
        present(controller, animated: true, completion: nil)
    }
}

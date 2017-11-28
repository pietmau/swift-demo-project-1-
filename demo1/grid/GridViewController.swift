//
//  GridViewController.swift
//  demo1
//
//  Created by Maurizio Pietrantuono on 28/11/2017.
//  Copyright © 2017 Maurizio Pietrantuono. All rights reserved.
//

import UIKit

class GridViewController: UIViewController {
    let SPACING = CGFloat(3)
    @IBOutlet weak var grid: UICollectionView!
    private var delegate: GridDelegate? = nil
    private var layout: UICollectionViewDelegateFlowLayout? = nil
    
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
        delegate = GridDelegate()
        grid?.dataSource = delegate
        layout = Layout()
        grid?.delegate = layout
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

//
//  GridViewController.swift
//  demo1
//
//  Created by Maurizio Pietrantuono on 28/11/2017.
//  Copyright © 2017 Maurizio Pietrantuono. All rights reserved.
//

import UIKit

class GridViewController: UIViewController, MainView {
    let SPACING = CGFloat(3)
    private var presenter: MainPresenter?
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
        presenter = MainPresenter()
        presenter!.view = self
        delegate = GridDelegate()
        grid?.dataSource = delegate
        layout = Layout()
        grid?.delegate = layout
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter?.searchBarSearchButtonClicked(searchText)
    }
}

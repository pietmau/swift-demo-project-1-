//
//  ViewController.swift
//  demo1
//
//  Created by Maurizio Pietrantuono on 24/11/2017.
//  Copyright © 2017 Maurizio Pietrantuono. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate, MainView {
    private var presenter: MainPresenter?
    @IBOutlet weak var searchBar: UISearchBar!

    func setResults(_ results: [Results]) {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = MainPresenter()
        presenter!.view = self
        searchBar?.delegate = self as? UISearchBarDelegate
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        presenter?.searchBarSearchButtonClicked(searchBar.text)
    }

}


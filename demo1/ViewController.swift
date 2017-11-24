//
//  ViewController.swift
//  demo1
//
//  Created by Maurizio Pietrantuono on 24/11/2017.
//  Copyright © 2017 Maurizio Pietrantuono. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar?.delegate = self as? UISearchBarDelegate
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    }


}


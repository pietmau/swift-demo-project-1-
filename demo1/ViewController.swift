//
//  ViewController.swift
//  demo1
//
//  Created by Maurizio Pietrantuono on 24/11/2017.
//  Copyright © 2017 Maurizio Pietrantuono. All rights reserved.
//

import UIKit
import Alamofire


class ViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar?.delegate = self as? UISearchBarDelegate
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let queryString = searchBar.text
        if (queryString == nil || queryString?.isEmpty == true) {
            return
        }
        let url = "https://itunes.apple.com/search";
        let params = ["media": "podcast", "limit": "100", "term": queryString!]
        Alamofire.request(url, parameters: params)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["text/javascript"])
            .responseData(){ response in
//                switch response.result {
//                case .success(let value):
//                print("JSON: \(value)")
//                case .failure(let error):
//                {onError(error)}
//                }
                
        }
    }
    
}


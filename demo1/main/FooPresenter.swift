//
// Created by Maurizio Pietrantuono on 28/11/2017.
// Copyright (c) 2017 Maurizio Pietrantuono. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class FooPresenter: NSObject, UISearchBarDelegate {

    var view: FooView? = nil

    private func onError(_ error: Error?) {

    }

    private func onSuccess(response: DataResponse<Any>) {
        if let dictionary = response.value as? NSDictionary, let searchResults = SearchResult(dictionary: dictionary)?.results {
            view?.setResults(searchResults)
            view?.hideBrian()
        }
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if (searchText.isEmpty) {
            return
        }
        let url = "https://itunes.apple.com/search";
        let params = ["media": "podcast", "limit": "100", "term": searchText]
        Alamofire.request(url, parameters: params)
                .validate(statusCode: 200..<300)
                .validate(contentType: ["text/javascript"])
                .responseJSON() { response in
                    switch response.result {
                    case .success:
                        self.onSuccess(response: response)
                        return
                    case .failure:
                        self.onError(response.error)
                        return
                    }
                }
    }
}

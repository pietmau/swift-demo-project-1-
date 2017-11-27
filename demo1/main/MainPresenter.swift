//
// Created by Maurizio Pietrantuono on 27/11/2017.
// Copyright (c) 2017 Maurizio Pietrantuono. All rights reserved.
//

import Foundation
import Alamofire

class MainPresenter {
    var view: MainView?

    func searchBarSearchButtonClicked(_ queryString: String?) {
        if (queryString == nil || queryString?.isEmpty == true) {
            return
        }
        let url = "https://itunes.apple.com/search";
        let params = ["media": "podcast", "limit": "100", "term": queryString!]
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

    private func onError(_ error: Error?) {

    }

    private func onSuccess(response: DataResponse<Any>) {
        if let dictionary = response.value as? NSDictionary, let searchResults = SearchResult(dictionary: dictionary)?.results {
            view?.setResults(searchResults)
        }
    }
}

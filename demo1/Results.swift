/* 
Copyright (c) 2017 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import Foundation
 
/* For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar */

public class Results {
	public var wrapperType : String?
	public var kind : String?
	public var collectionId : Int?
	public var trackId : Int?
	public var artistName : String?
	public var collectionName : String?
	public var trackName : String?
	public var collectionCensoredName : String?
	public var trackCensoredName : String?
	public var collectionViewUrl : String?
	public var feedUrl : String?
	public var trackViewUrl : String?
	public var artworkUrl30 : String?
	public var artworkUrl60 : String?
	public var artworkUrl100 : String?
	public var collectionPrice : Int?
	public var trackPrice : Int?
	public var trackRentalPrice : Int?
	public var collectionHdPrice : Int?
	public var trackHdPrice : Int?
	public var trackHdRentalPrice : Int?
	public var releaseDate : String?
	public var collectionExplicitness : String?
	public var trackExplicitness : String?
	public var trackCount : Int?
	public var country : String?
	public var currency : String?
	public var primaryGenreName : String?
	public var contentAdvisoryRating : String?
	public var artworkUrl600 : String?
	public var genreIds : Array<Int>?
	public var genres : Array<String>?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let results_list = Results.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of Results Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [Results]
    {
        var models:[Results] = []
        for item in array
        {
            models.append(Results(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let results = Results(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: Results Instance.
*/
	required public init?(dictionary: NSDictionary) {

		wrapperType = dictionary["wrapperType"] as? String
		kind = dictionary["kind"] as? String
		collectionId = dictionary["collectionId"] as? Int
		trackId = dictionary["trackId"] as? Int
		artistName = dictionary["artistName"] as? String
		collectionName = dictionary["collectionName"] as? String
		trackName = dictionary["trackName"] as? String
		collectionCensoredName = dictionary["collectionCensoredName"] as? String
		trackCensoredName = dictionary["trackCensoredName"] as? String
		collectionViewUrl = dictionary["collectionViewUrl"] as? String
		feedUrl = dictionary["feedUrl"] as? String
		trackViewUrl = dictionary["trackViewUrl"] as? String
		artworkUrl30 = dictionary["artworkUrl30"] as? String
		artworkUrl60 = dictionary["artworkUrl60"] as? String
		artworkUrl100 = dictionary["artworkUrl100"] as? String
		collectionPrice = dictionary["collectionPrice"] as? Int
		trackPrice = dictionary["trackPrice"] as? Int
		trackRentalPrice = dictionary["trackRentalPrice"] as? Int
		collectionHdPrice = dictionary["collectionHdPrice"] as? Int
		trackHdPrice = dictionary["trackHdPrice"] as? Int
		trackHdRentalPrice = dictionary["trackHdRentalPrice"] as? Int
		releaseDate = dictionary["releaseDate"] as? String
		collectionExplicitness = dictionary["collectionExplicitness"] as? String
		trackExplicitness = dictionary["trackExplicitness"] as? String
		trackCount = dictionary["trackCount"] as? Int
		country = dictionary["country"] as? String
		currency = dictionary["currency"] as? String
		primaryGenreName = dictionary["primaryGenreName"] as? String
		contentAdvisoryRating = dictionary["contentAdvisoryRating"] as? String
		artworkUrl600 = dictionary["artworkUrl600"] as? String
		if (dictionary["genreIds"] != nil) { genreIds = dictionary["genreIds"] as? [Int] }
		if (dictionary["genres"] != nil) { genres = dictionary["genres"] as? [String] }
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.wrapperType, forKey: "wrapperType")
		dictionary.setValue(self.kind, forKey: "kind")
		dictionary.setValue(self.collectionId, forKey: "collectionId")
		dictionary.setValue(self.trackId, forKey: "trackId")
		dictionary.setValue(self.artistName, forKey: "artistName")
		dictionary.setValue(self.collectionName, forKey: "collectionName")
		dictionary.setValue(self.trackName, forKey: "trackName")
		dictionary.setValue(self.collectionCensoredName, forKey: "collectionCensoredName")
		dictionary.setValue(self.trackCensoredName, forKey: "trackCensoredName")
		dictionary.setValue(self.collectionViewUrl, forKey: "collectionViewUrl")
		dictionary.setValue(self.feedUrl, forKey: "feedUrl")
		dictionary.setValue(self.trackViewUrl, forKey: "trackViewUrl")
		dictionary.setValue(self.artworkUrl30, forKey: "artworkUrl30")
		dictionary.setValue(self.artworkUrl60, forKey: "artworkUrl60")
		dictionary.setValue(self.artworkUrl100, forKey: "artworkUrl100")
		dictionary.setValue(self.collectionPrice, forKey: "collectionPrice")
		dictionary.setValue(self.trackPrice, forKey: "trackPrice")
		dictionary.setValue(self.trackRentalPrice, forKey: "trackRentalPrice")
		dictionary.setValue(self.collectionHdPrice, forKey: "collectionHdPrice")
		dictionary.setValue(self.trackHdPrice, forKey: "trackHdPrice")
		dictionary.setValue(self.trackHdRentalPrice, forKey: "trackHdRentalPrice")
		dictionary.setValue(self.releaseDate, forKey: "releaseDate")
		dictionary.setValue(self.collectionExplicitness, forKey: "collectionExplicitness")
		dictionary.setValue(self.trackExplicitness, forKey: "trackExplicitness")
		dictionary.setValue(self.trackCount, forKey: "trackCount")
		dictionary.setValue(self.country, forKey: "country")
		dictionary.setValue(self.currency, forKey: "currency")
		dictionary.setValue(self.primaryGenreName, forKey: "primaryGenreName")
		dictionary.setValue(self.contentAdvisoryRating, forKey: "contentAdvisoryRating")
		dictionary.setValue(self.artworkUrl600, forKey: "artworkUrl600")

		return dictionary
	}

}
/* 
Copyright (c) 2017 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Results : Codable {
	let wrapperType : String?
	let kind : String?
	let collectionId : Int?
	let trackId : Int?
	let artistName : String?
	let collectionName : String?
	let trackName : String?
	let collectionCensoredName : String?
	let trackCensoredName : String?
	let collectionViewUrl : String?
	let feedUrl : String?
	let trackViewUrl : String?
	let artworkUrl30 : String?
	let artworkUrl60 : String?
	let artworkUrl100 : String?
	let collectionPrice : Int?
	let trackPrice : Int?
	let trackRentalPrice : Int?
	let collectionHdPrice : Int?
	let trackHdPrice : Int?
	let trackHdRentalPrice : Int?
	let releaseDate : String?
	let collectionExplicitness : String?
	let trackExplicitness : String?
	let trackCount : Int?
	let country : String?
	let currency : String?
	let primaryGenreName : String?
	let contentAdvisoryRating : String?
	let artworkUrl600 : String?
	let genreIds : [Int]?
	let genres : [String]?

	enum CodingKeys: String, CodingKey {

		case wrapperType = "wrapperType"
		case kind = "kind"
		case collectionId = "collectionId"
		case trackId = "trackId"
		case artistName = "artistName"
		case collectionName = "collectionName"
		case trackName = "trackName"
		case collectionCensoredName = "collectionCensoredName"
		case trackCensoredName = "trackCensoredName"
		case collectionViewUrl = "collectionViewUrl"
		case feedUrl = "feedUrl"
		case trackViewUrl = "trackViewUrl"
		case artworkUrl30 = "artworkUrl30"
		case artworkUrl60 = "artworkUrl60"
		case artworkUrl100 = "artworkUrl100"
		case collectionPrice = "collectionPrice"
		case trackPrice = "trackPrice"
		case trackRentalPrice = "trackRentalPrice"
		case collectionHdPrice = "collectionHdPrice"
		case trackHdPrice = "trackHdPrice"
		case trackHdRentalPrice = "trackHdRentalPrice"
		case releaseDate = "releaseDate"
		case collectionExplicitness = "collectionExplicitness"
		case trackExplicitness = "trackExplicitness"
		case trackCount = "trackCount"
		case country = "country"
		case currency = "currency"
		case primaryGenreName = "primaryGenreName"
		case contentAdvisoryRating = "contentAdvisoryRating"
		case artworkUrl600 = "artworkUrl600"
		case genreIds = "genreIds"
		case genres = "genres"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		wrapperType = try values.decodeIfPresent(String.self, forKey: .wrapperType)
		kind = try values.decodeIfPresent(String.self, forKey: .kind)
		collectionId = try values.decodeIfPresent(Int.self, forKey: .collectionId)
		trackId = try values.decodeIfPresent(Int.self, forKey: .trackId)
		artistName = try values.decodeIfPresent(String.self, forKey: .artistName)
		collectionName = try values.decodeIfPresent(String.self, forKey: .collectionName)
		trackName = try values.decodeIfPresent(String.self, forKey: .trackName)
		collectionCensoredName = try values.decodeIfPresent(String.self, forKey: .collectionCensoredName)
		trackCensoredName = try values.decodeIfPresent(String.self, forKey: .trackCensoredName)
		collectionViewUrl = try values.decodeIfPresent(String.self, forKey: .collectionViewUrl)
		feedUrl = try values.decodeIfPresent(String.self, forKey: .feedUrl)
		trackViewUrl = try values.decodeIfPresent(String.self, forKey: .trackViewUrl)
		artworkUrl30 = try values.decodeIfPresent(String.self, forKey: .artworkUrl30)
		artworkUrl60 = try values.decodeIfPresent(String.self, forKey: .artworkUrl60)
		artworkUrl100 = try values.decodeIfPresent(String.self, forKey: .artworkUrl100)
		collectionPrice = try values.decodeIfPresent(Int.self, forKey: .collectionPrice)
		trackPrice = try values.decodeIfPresent(Int.self, forKey: .trackPrice)
		trackRentalPrice = try values.decodeIfPresent(Int.self, forKey: .trackRentalPrice)
		collectionHdPrice = try values.decodeIfPresent(Int.self, forKey: .collectionHdPrice)
		trackHdPrice = try values.decodeIfPresent(Int.self, forKey: .trackHdPrice)
		trackHdRentalPrice = try values.decodeIfPresent(Int.self, forKey: .trackHdRentalPrice)
		releaseDate = try values.decodeIfPresent(String.self, forKey: .releaseDate)
		collectionExplicitness = try values.decodeIfPresent(String.self, forKey: .collectionExplicitness)
		trackExplicitness = try values.decodeIfPresent(String.self, forKey: .trackExplicitness)
		trackCount = try values.decodeIfPresent(Int.self, forKey: .trackCount)
		country = try values.decodeIfPresent(String.self, forKey: .country)
		currency = try values.decodeIfPresent(String.self, forKey: .currency)
		primaryGenreName = try values.decodeIfPresent(String.self, forKey: .primaryGenreName)
		contentAdvisoryRating = try values.decodeIfPresent(String.self, forKey: .contentAdvisoryRating)
		artworkUrl600 = try values.decodeIfPresent(String.self, forKey: .artworkUrl600)
		genreIds = try values.decodeIfPresent([Int].self, forKey: .genreIds)
		genres = try values.decodeIfPresent([String].self, forKey: .genres)
	}

}
//
//  RssFeedCoreData+CoreDataProperties.swift
//  demo1
//
//  Created by Maurizio Pietrantuono on 07/12/2017.
//  Copyright © 2017 Maurizio Pietrantuono. All rights reserved.
//
//

import Foundation
import CoreData


extension RssFeedCoreData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RssFeedCoreData> {
        return NSFetchRequest<RssFeedCoreData>(entityName: "RssFeedCoreData")
    }

    @NSManaged public var artworkUrl100: String?
    @NSManaged public var trackName: String?
    @NSManaged public var feedUrl: String?
    @NSManaged public var collectionName: String?
    @NSManaged public var artworkUrl600: String?
    @NSManaged public var items: NSSet?

}

// MARK: Generated accessors for items
extension RssFeedCoreData {

    @objc(addItemsObject:)
    @NSManaged public func addToItems(_ value: RSSFeedItemCoreData)

    @objc(removeItemsObject:)
    @NSManaged public func removeFromItems(_ value: RSSFeedItemCoreData)

    @objc(addItems:)
    @NSManaged public func addToItems(_ values: NSSet)

    @objc(removeItems:)
    @NSManaged public func removeFromItems(_ values: NSSet)

}

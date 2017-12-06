//
//  RSSFeedItemCoreData+CoreDataProperties.swift
//  demo1
//
//  Created by Maurizio Pietrantuono on 07/12/2017.
//  Copyright © 2017 Maurizio Pietrantuono. All rights reserved.
//
//

import Foundation
import CoreData


extension RSSFeedItemCoreData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RSSFeedItemCoreData> {
        return NSFetchRequest<RSSFeedItemCoreData>(entityName: "RSSFeedItemCoreData")
    }

    @NSManaged public var title: String?
    @NSManaged public var feed: RssFeedCoreData?

}

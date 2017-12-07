//
// Created by Maurizio Pietrantuono on 06/12/2017.
// Copyright (c) 2017 Maurizio Pietrantuono. All rights reserved.
//

import Foundation
import CoreData

class DataManagerCoreData: DataManager {
    let context: NSManagedObjectContext
    let persistentContainer: NSPersistentContainer
    static let INSTANCE = DataManagerCoreData()

    private init() {
        persistentContainer = NSPersistentContainer(name: "Model")

        persistentContainer.loadPersistentStores(completionHandler: {
            (storeDescription, error) in
            print(storeDescription)
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })

        context = persistentContainer.viewContext
    }

    func save() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let err = error as NSError
                fatalError("Unresolved errror \(err), \(err.userInfo)")
            }
        }
    }

    func loadSubscribedFeeds() -> [PodcastCoreData] {
        var result: [PodcastCoreData] = []
        do {
            result = try context.fetch(PodcastCoreData.fetchRequest())
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        return result
    }
}

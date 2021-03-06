//
//  CoreDataStack.swift
//  CoreDataHelloWord
//
//  Created by jose luis sanchez-porro godoy on 13/09/2017.
//  Copyright © 2017 jose luis sanchez-porro godoy. All rights reserved.
//

import CoreData


public class  CoreDataStack{
   
    public func createContainer(dbName: String) -> NSPersistentContainer {
        let container = NSPersistentContainer(name: dbName)
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            print("💾  \(storeDescription.description) " )
            if let error = error as NSError? {
                fatalError(" 💩 Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }
    

    public func saveContext (context: NSManagedObjectContext) {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}



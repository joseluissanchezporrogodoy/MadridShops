//
//  SaveAllShopsInteractor.swift
//  MadridShops
//
//  Created by jose luis sanchez-porro godoy on 18/09/2017.
//  Copyright © 2017 jose luis sanchez-porro godoy. All rights reserved.
//

import CoreData


protocol SaveAllInteractor {
    // execute: save all shops.
    func execute(entities: Entities,type: String?,context: NSManagedObjectContext,onSuccess:  () -> Void, onError: errorClosure)
    func execute(entities: Entities,type: String?, context: NSManagedObjectContext,onSuccess:  () -> Void)
}

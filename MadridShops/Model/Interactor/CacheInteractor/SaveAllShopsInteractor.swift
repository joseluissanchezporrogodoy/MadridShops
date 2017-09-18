//
//  SaveAllShopsInteractor.swift
//  MadridShops
//
//  Created by jose luis sanchez-porro godoy on 18/09/2017.
//  Copyright © 2017 jose luis sanchez-porro godoy. All rights reserved.
//

import CoreData


protocol SaveAllShopsInteractor {
    // execute: save all shops.
    func execute(shops: Shops,context: NSManagedObjectContext,onSuccess: @escaping (Shops) -> Void, onError: errorClosure)
    func execute(shops: Shops,context: NSManagedObjectContext,onSuccess: @escaping (Shops) -> Void)
}

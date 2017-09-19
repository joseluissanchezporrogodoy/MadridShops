//
//  SaveAllShopsInteractorImpl.swift
//  MadridShops
//
//  Created by jose luis sanchez-porro godoy on 18/09/2017.
//  Copyright © 2017 jose luis sanchez-porro godoy. All rights reserved.
//

import CoreData

class SaveAllShopsInteractorImps: SaveAllShopsInteractor {
    func execute(shops: Shops, context: NSManagedObjectContext, onSuccess: @escaping (Shops) -> Void, onError: errorClosure) {
        for i in 0..<shops.count(){
            let shop = shops.get(index: i)
            
            let _ = mapShopIntoShopCD(context: context, shop: shop)
        }
        do{
        try context.save()
            onSuccess(shops)
        } catch{
            //onError(nil)
        }
    
    }
    
    func execute(shops: Shops, context: NSManagedObjectContext, onSuccess: @escaping (Shops) -> Void) {
        execute(shops: shops, context: context, onSuccess: onSuccess, onError: nil)
    }
    
    
}

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
            //mapping shops in to shopCD hacer una función de mapeo para poder testearla
            let shopCD = ShopCD(context:context)
            shopCD.name = shop.name
            shopCD.address = shop.address
            shopCD.image = shop.image
            shopCD.logo = shop.logo
//            shopCD.latitude = shop.latitude!
//            shopCD.longitude = shop.longitude!
//            shopCD.description_en = shop.description
//            shopCD.openingHours  = shop.openingHours
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

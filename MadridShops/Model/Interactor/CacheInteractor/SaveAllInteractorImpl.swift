//
//  SaveAllShopsInteractorImpl.swift
//  MadridShops
//
//  Created by jose luis sanchez-porro godoy on 18/09/2017.
//  Copyright © 2017 jose luis sanchez-porro godoy. All rights reserved.
//

import CoreData

class SaveAllInteractorImps: SaveAllInteractor {
  
    
    func execute(entities: Entities,type: String?, context: NSManagedObjectContext, onSuccess: () -> Void, onError: errorClosure) {
        for i in 0..<entities.count(){
            let entity = entities.get(index: i)
            let entityCD = mapEntityIntoEntityCD(context: context, entity: entity)
            entityCD.type = type!
        }
        do{
        try context.save()
            onSuccess()
        } catch{
            //onError(nil)
        }
    
    }
    
    func execute(entities: Entities, type: String?,context: NSManagedObjectContext, onSuccess:() -> Void) {
        execute(entities: entities,  type: type, context: context, onSuccess: onSuccess, onError: nil)
    }
    
    
}

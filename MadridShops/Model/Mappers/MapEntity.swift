//
//  MapShops.swift
//  MadridShops
//
//  Created by José Luis Sánchez-Porro Godoy on 19/9/17.
//  Copyright © 2017 jose luis sanchez-porro godoy. All rights reserved.
//

import CoreData

func mapEntityCDIntoEntity(entityCD: EntityCD) -> Entity {
    let shop = Entity(name: entityCD.name ?? "Empty")
    shop.address = entityCD.address ?? ""
    shop.image = entityCD.image ?? ""
    shop.logo = entityCD.logo ?? ""
    shop.latitude = entityCD.latitude
    shop.longitude = entityCD.longitude
    shop.description_en = entityCD.description_en ?? ""
    shop.description_es = entityCD.description_es ?? ""
    shop.openingHours_es = entityCD.openingHours_es ?? ""
    shop.openingHours_en = entityCD.openingHours_en ?? ""
    shop.imageData = entityCD.imageData ?? nil
    shop.imageLogoData = entityCD.logoImageData ?? nil
    shop.imageMapData = entityCD.mapImageData ?? nil
    
    return shop
}

func mapShopIntoShopCD(context: NSManagedObjectContext, entity: Entity) -> EntityCD {
    
    let entityCD = EntityCD(context: context)
    entityCD.name = entity.name
    entityCD.address = entity.address
    entityCD.image = entity.image
    entityCD.logo = entity.logo
    entityCD.latitude = entity.latitude ?? 0.0
    entityCD.longitude = entity.longitude ?? 0.0
    entityCD.description_es = entity.description_es
    entityCD.openingHours_es = entity.openingHours_es
    entityCD.description_en = entity.description_en
    entityCD.openingHours_en = entity.openingHours_en
    entityCD.imageData = entity.imageData ?? nil
    entityCD.logoImageData = entity.imageLogoData ?? nil
    entityCD.mapImageData = entity.imageMapData ?? nil
    
    return entityCD
}

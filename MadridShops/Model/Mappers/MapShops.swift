//
//  MapShops.swift
//  MadridShops
//
//  Created by José Luis Sánchez-Porro Godoy on 19/9/17.
//  Copyright © 2017 jose luis sanchez-porro godoy. All rights reserved.
//

import CoreData

func mapShopCDIntoShop(shopCD: ShopCD) -> Shop {
    let shop = Shop(name: shopCD.name ?? "Empty")
    shop.address = shopCD.address ?? ""
    shop.image = shopCD.image ?? ""
    shop.logo = shopCD.logo ?? ""
    
    shop.latitude = shopCD.latitude
    shop.longitude = shopCD.longitude
    
    shop.description_en = shopCD.description_en ?? ""
    shop.description_es = shopCD.description_es ?? ""
    shop.openingHours_es = shopCD.openingHours_es ?? ""
    shop.openingHours_en = shopCD.openingHours_en ?? ""
    
    ///
    shop.imageData = shopCD.imageData ?? nil
    shop.imageLogoData = shopCD.logoImageData ?? nil
    shop.imageMapData = shopCD.mapImageData ?? nil
    
    return shop
}

func mapShopIntoShopCD(context: NSManagedObjectContext, shop: Shop) -> ShopCD {
    // mapping shop into ShopCD
    let shopCD = ShopCD(context: context)
    shopCD.name = shop.name
    shopCD.address = shop.address
    shopCD.image = shop.image
    shopCD.logo = shop.logo
    
    shopCD.latitude = shop.latitude ?? 0.0
    shopCD.longitude = shop.longitude ?? 0.0
    shopCD.description_es = shop.description_es
    shopCD.openingHours_es = shop.openingHours_es
    shopCD.description_en = shop.description_en
    shopCD.openingHours_en = shop.openingHours_en
    shopCD.imageData = shop.imageData ?? nil
    shopCD.logoImageData = shop.imageLogoData ?? nil
    shopCD.mapImageData = shop.imageMapData ?? nil
    
    return shopCD
}

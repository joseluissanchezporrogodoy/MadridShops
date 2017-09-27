//
//  JSONParser.swift
//  MadridShops
//
//  Created by jose luis sanchez-porro godoy on 12/09/2017.
//  Copyright © 2017 jose luis sanchez-porro godoy. All rights reserved.
//

import Foundation

func parseShops(data: Data) -> Shops{
    let shops = Shops()
    do {
        let jsonObject = try JSONSerialization.jsonObject(with: data , options: JSONSerialization.ReadingOptions.allowFragments) as! Dictionary <String,Any>
        let result = jsonObject["result"] as! [Dictionary<String,Any>]
        for shopJson in result{
            let shop = Shop(name: shopJson["name"]! as! String)
            shop.address = shopJson["address"]! as! String
            shop.logo = shopJson["logo_img"] as! String
            shop.image = shopJson["img"] as! String
            shop.description_es = shopJson["description_es"] as! String
            shop.description_en = shopJson["description_en"] as! String
            shop.longitude = (shopJson["gps_lon"] as! String).toDouble()
            shop.latitude =  (shopJson["gps_lat"] as! String).toDouble()
            shop.openingHours_en = shopJson["opening_hours_en"] as! String
            shop.openingHours_es = shopJson["opening_hours_es"] as! String
            
            shops.add(shop: shop)
        }
    }catch{
         print("Error parsing JSON")
    }
    return shops
}

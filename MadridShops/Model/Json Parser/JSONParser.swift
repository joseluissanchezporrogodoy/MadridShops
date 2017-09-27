//
//  JSONParser.swift
//  MadridShops
//
//  Created by jose luis sanchez-porro godoy on 12/09/2017.
//  Copyright © 2017 jose luis sanchez-porro godoy. All rights reserved.
//

import Foundation

func parseEntities(data: Data) -> Entities{
    let entities = Entities()
    do {
        let jsonObject = try JSONSerialization.jsonObject(with: data , options: JSONSerialization.ReadingOptions.allowFragments) as! Dictionary <String,Any>
        let result = jsonObject["result"] as! [Dictionary<String,Any>]
        for entityJson in result{
            let entity = Entity(name: entityJson["name"]! as! String)
            entity.address = entityJson["address"]! as! String
            entity.logo = entityJson["logo_img"] as! String
            entity.image = entityJson["img"] as! String
            entity.description_es = entityJson["description_es"] as! String
            entity.description_en = entityJson["description_en"] as! String
            entity.longitude = (entityJson["gps_lon"] as! String).toDouble()
            entity.latitude =  (entityJson["gps_lat"] as! String).toDouble()
            entity.openingHours_en = entityJson["opening_hours_en"] as! String
            entity.openingHours_es = entityJson["opening_hours_es"] as! String
            
            entities.add(entity: entity)
        }
    }catch{
         print("Error parsing JSON")
    }
    return entities
}

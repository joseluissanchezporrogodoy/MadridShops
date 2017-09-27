//
//  Shop.swift
//  MadridShops
//
//  Created by jose luis sanchez-porro godoy on 07/09/2017.
//  Copyright © 2017 jose luis sanchez-porro godoy. All rights reserved.
//

import Foundation
public enum Type: String {
    
    case shop
    
    case activity
}
public class Entity {
    var name: String
    var description_es: String = ""
    var description_en: String = ""
    var latitude: Double? = nil
    var longitude: Double? = nil
    var image: String = ""
    var logo: String = ""
    var openingHours_es: String = ""
    var openingHours_en: String = ""
    var address: String = ""
    var imageData: Data? = nil
    var imageMapData: Data? = nil
    var imageLogoData: Data? = nil
    
    public init(name: String) {
        self.name = name
    }
    
}

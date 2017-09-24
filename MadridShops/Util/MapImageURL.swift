//
//  MapImageURL.swift
//  MadridShops
//
//  Created by José Luis Sánchez-Porro Godoy on 22/9/17.
//  Copyright © 2017 jose luis sanchez-porro godoy. All rights reserved.
//

import Foundation

func getURLImageMapFromEntity(entity: Shop) -> String{
    let latitude = entity.latitude?.toString()
    let longitude = entity.longitude?.toString()
    let urlLatitude = URL_CONSTANTS.urlGoogleMapImage.replacingOccurrences(of: "LATITUDE", with: latitude!)
    let urlLongitude = urlLatitude.replacingOccurrences(of: "LONGITUDE", with: longitude!)
    print(urlLongitude)
    return urlLongitude
}



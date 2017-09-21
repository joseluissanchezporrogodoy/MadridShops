//
//  MapPin.swift
//  MadridShops
//
//  Created by José Luis Sánchez-Porro Godoy on 21/9/17.
//  Copyright © 2017 jose luis sanchez-porro godoy. All rights reserved.
//

import UIKit
import MapKit
class MapPin: NSObject, MKAnnotation {
    var title: String?
    //var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    
    init(shop: ShopCD) {
        self.coordinate = CLLocationCoordinate2D(latitude: shop.latitude, longitude: shop.longitude)
        
        self.title = shop.name
        //self.subtitle = shop.subtitle
    }
}
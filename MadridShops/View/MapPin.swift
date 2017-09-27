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
    var data: Data?
    var entity: EntityCD
    init(entity: EntityCD) {
        self.coordinate = CLLocationCoordinate2D(latitude: entity.latitude, longitude: entity.longitude)
        self.title = entity.name
        self.data = entity.logoImageData
        self.entity = entity
        //self.subtitle = shop.subtitle
        super.init()
    }
}

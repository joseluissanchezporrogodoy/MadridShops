//
//  ShopCell.swift
//  MadridShops
//
//  Created by jose luis sanchez-porro godoy on 08/09/2017.
//  Copyright © 2017 jose luis sanchez-porro godoy. All rights reserved.
//

import UIKit

class EntityCell: UICollectionViewCell {
    var entity: Entity?
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var openingHoursLabel: UILabel!
    
    func refresh(shop: Entity){
        self.entity = shop
        self.label.text = shop.name
        // TODO: Image View
       
//        self.shop?.logo.loadImage(into: imageView,activityIndicator: self.activityIndicator)
        if let data = shop.imageLogoData{
            self.imageView.image = UIImage(data: data)
            imageView.clipsToBounds = true
        }
        let preferredLanguage = NSLocale.preferredLanguages[0]
        if (preferredLanguage.range(of:"es") != nil) {
            self.openingHoursLabel.text = self.entity?.openingHours_es
        }
        if (preferredLanguage.range(of:"en") != nil){
            self.openingHoursLabel.text = self.entity?.openingHours_en
        }
        
        UIView.animate(withDuration: 1.0) {
            self.imageView.layer.cornerRadius = 30
            
        }
        
    }
}

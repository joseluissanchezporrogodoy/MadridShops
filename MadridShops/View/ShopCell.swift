//
//  ShopCell.swift
//  MadridShops
//
//  Created by jose luis sanchez-porro godoy on 08/09/2017.
//  Copyright © 2017 jose luis sanchez-porro godoy. All rights reserved.
//

import UIKit

class ShopCell: UICollectionViewCell {
    var shop: Shop?
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    func refresh(shop: Shop){
        self.shop = shop
        self.label.text = shop.name
        // TODO: Image View
        self.activityIndicator.startAnimating()
        self.shop?.logo.loadImage(into: imageView,activityIndicator: self.activityIndicator)
        imageView.clipsToBounds = true
        UIView.animate(withDuration: 1.0) {
            self.imageView.layer.cornerRadius = 30
            
        }
        
    }
}

//
//  ShopDetailViewController.swift
//  MadridShops
//
//  Created by jose luis sanchez-porro godoy on 12/09/2017.
//  Copyright © 2017 jose luis sanchez-porro godoy. All rights reserved.
//

import UIKit

class ShopDetailViewController: UIViewController {
    var shop : Shop!
    
    @IBOutlet weak var textoTienda: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = self.shop.name
        let preferredLanguage = NSLocale.preferredLanguages[0]
        if (preferredLanguage.range(of:"es") != nil) {
            self.textoTienda.text = self.shop.description_es
        }
        if (preferredLanguage.range(of:"en") != nil){
            self.textoTienda.text = self.shop.description_en
        }
        
        //self.activityIndicator.startAnimating()
        //self.shop.image.loadImage(into: imagen,activityIndicator: self.activityIndicator)
        //let imagemapa = getURLImageMapFromEntity(entity: shop)
        //imagemapa.loadImage(into: imagen, activityIndicator: self.activityIndicator)
        //imagen.image = UIImage(data: shop.imageMapData!)
        if let mapData = shop.imageMapData {
            self.imageView.image = UIImage(data: mapData)
        }
        
    }
}

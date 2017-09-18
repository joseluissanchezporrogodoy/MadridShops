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
    //    var shop : Shop!{
//        didSet{
//            self.title = .name
//        }
//    }
    
    @IBOutlet weak var textoTienda: UITextView!
    @IBOutlet weak var imagen: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = self.shop.name
        self.textoTienda.text = self.shop.description
        self.shop.image.loadImage(into: imagen)
    }
    
    

   

}

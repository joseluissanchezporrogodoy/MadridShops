//
//  ViewController.swift
//  MadridShops
//
//  Created by jose luis sanchez-porro godoy on 07/09/2017.
//  Copyright © 2017 jose luis sanchez-porro godoy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var shops: Shops?
    
    @IBOutlet weak var shopsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let downloadShopsInteractor:DownloadAllShopsInteractor = DownloadAllShopsInteractorFakeImpl()
//        downloadShopsInteractor.execute(onSuccess: { (shops: Shops) in
//            // todo Ok
//        }) { (onError: Error) in
//            // error
//        }
//
//        downloadShopsInteractor.execute(onSuccess: { (shops: Shops) in
//            // todo Ok
//        })
        
        downloadShopsInteractor.execute{ (shops: Shops) in
            // todo Ok
            print("Name" + shops.get(index: 0).name)
            self.shops = shops
            
            // Lo pongo cuando tenga tiendas
            self.shopsCollectionView.delegate = self
            self.shopsCollectionView.dataSource = self
        }
        
    }
}


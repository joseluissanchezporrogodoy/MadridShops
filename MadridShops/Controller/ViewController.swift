//
//  ViewController.swift
//  MadridShops
//
//  Created by jose luis sanchez-porro godoy on 07/09/2017.
//  Copyright © 2017 jose luis sanchez-porro godoy. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController {
    
    var context: NSManagedObjectContext!
    var shops: Shops?
    
    @IBOutlet weak var shopsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let downloadShopsInteractor:DownloadAllShopsInteractor = DownloadAllShopsInteractorNSURLSessionImpl()
        shopsCollectionView.register(UINib(nibName: "ShopCell", bundle: nil), forCellWithReuseIdentifier: "ShopCell")
        downloadShopsInteractor.execute{ (shops: Shops) in
            // todo Ok
            print("Name" + shops.get(index: 0).name)
            self.shops = shops
            
            // Lo pongo cuando tenga tiendas
            self.shopsCollectionView.delegate = self
            self.shopsCollectionView.dataSource = self
            
            // Guardo en CoreData a través del Interactor Habría que cachear si ya se han grabado las tiendas.
            let cacheInteractor = SaveAllShopsInteractorImps()
            cacheInteractor.execute(shops: shops, context: self.context, onSuccess: { (shops: Shops) in
                
            })
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowShopDetailSegue"{
            let vc = segue.destination as! ShopDetailViewController
            //let indexPath = self.shopsCollectionView.indexPathsForSelectedItems![0]// lo puedo obtener del collection
           // let shop = self.shops?.get(index: indexPath.row)
            let shop = sender as! Shop
            vc.shop = shop
            
        }
    }
}


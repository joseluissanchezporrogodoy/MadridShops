//
//  DownloadAllShopsInteractorFakeImpl.swift
//  MadridShops
//
//  Created by jose luis sanchez-porro godoy on 08/09/2017.
//  Copyright © 2017 jose luis sanchez-porro godoy. All rights reserved.
//

import Foundation

class DownloadAllShopsInteractorFakeImpl:DownloadAllShopsInteractor {
    
    func execute(onSuccess: @escaping (Shops) -> Void) {
        execute(onSuccess: onSuccess, onError: nil)
    }
    
    func execute(onSuccess: @escaping (Shops) -> Void, onError: errorClosure = nil) {
        // el escaping es no te cargues las variables hasta que no la saques fuera.
        //Esto se hará en segundo plano
        let shops = Shops()
        
        for i in 0...10{
            let shop = Shop(name: "Shop number \( i )")
            shop.address = "Address \( i )"
            shops.add(shop: shop)
        }
        
        OperationQueue.main.addOperation {
            onSuccess(shops)
        }
    }
    
    
}

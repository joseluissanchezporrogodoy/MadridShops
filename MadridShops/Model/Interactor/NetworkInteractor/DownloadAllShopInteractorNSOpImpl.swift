//
//  DownloadAllShopInteractorNSOpImpl.swift
//  MadridShops
//
//  Created by jose luis sanchez-porro godoy on 12/09/2017.
//  Copyright © 2017 jose luis sanchez-porro godoy. All rights reserved.
//

import Foundation

class DownloadAllShopInteractorNSOpImpl:DownloadAllShopsInteractor {
    
    func execute(onSuccess: @escaping (Shops) -> Void) {
        execute(onSuccess: onSuccess, onError: nil)
    }
    
    func execute(onSuccess: @escaping (Shops) -> Void, onError: errorClosure = nil) {
        
        let urlString = "https://madrid-shops.com/json_new/getShops.php"
        let queue = OperationQueue()
        queue.addOperation {
            if let url = URL(string: urlString), let data = NSData(contentsOf: url ) as Data?{
                let shops = parseShops(data: data )
                OperationQueue.main.addOperation {
                    onSuccess(shops)
                }
            }
        }
    }
}
    
    


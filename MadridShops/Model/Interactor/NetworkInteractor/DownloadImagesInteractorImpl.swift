//
//  DownloadImagesInteractorImpl.swift
//  MadridShops
//
//  Created by jose luis sanchez-porro godoy on 24/09/2017.
//  Copyright © 2017 jose luis sanchez-porro godoy. All rights reserved.
//

import Foundation

class DownloadImagesInteractorImpl: DownloadImagesInteractor {
    
    
    
    func execute(shops: Shops, onSuccess: @escaping (Shops) -> Void, onError: errorClosure) {
        let queue = OperationQueue()
        queue.addOperation {
            for i in 0..<shops.count(){
                let shop = shops.get(index: i)
                shop.imageLogoData = self.getImageData(urlString: shop.logo)
                shop.imageData = self.getImageData(urlString: shop.image)
                shop.imageMapData = self.getImageData(urlString: getURLImageMapFromEntity(entity: shop))
            }

            OperationQueue.main.addOperation {
                onSuccess(shops)
            }
        }
        
    }
    
    func execute(shops: Shops, onSuccess: @escaping (Shops) -> Void) {
        execute(shops: shops, onSuccess: onSuccess,onError: nil)
    }
    
    func getImageData(urlString: String) -> Data? {
        if let url = URL(string: urlString) {
            do {
                let data = try Data(contentsOf: url)
                return data
            } catch {
                print("Error in downloadImage " + error.localizedDescription)
                return nil
            }
        }else{
            return nil
        }
    }
}

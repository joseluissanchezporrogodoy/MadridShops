//
//  DownloadImagesInteractorImpl.swift
//  MadridShops
//
//  Created by jose luis sanchez-porro godoy on 24/09/2017.
//  Copyright © 2017 jose luis sanchez-porro godoy. All rights reserved.
//

import Foundation

class DownloadImagesInteractorImpl: DownloadImagesInteractor {
    func execute(entities: Entities, onSuccess: @escaping (Entities) -> Void, onError: errorClosure) {
        let queue = OperationQueue()
        queue.addOperation {
            for i in 0..<entities.count(){
                let entity = entities.get(index: i)
                entity.imageLogoData = self.getImageData(urlString: entity.logo)
                entity.imageData = self.getImageData(urlString: entity.image)
                entity.imageMapData = self.getImageData(urlString: getURLImageMapFromEntity(entity: entity))
            }

            OperationQueue.main.addOperation {
                onSuccess(entities)
            }
        }
        
    }
    
    func execute(entities: Entities, onSuccess: @escaping (Entities) -> Void) {
        execute(entities: entities, onSuccess: onSuccess,onError: nil)
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

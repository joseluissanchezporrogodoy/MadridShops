//
//  DownloadAllShopsInteractorNSURLSessionImpl.swift
//  MadridShops
//
//  Created by jose luis sanchez-porro godoy on 12/09/2017.
//  Copyright © 2017 jose luis sanchez-porro godoy. All rights reserved.
//

import Foundation

class DownloadAllInteractorNSURLSessionImpl: DownloadAllInteractor {
    func execute(type: String?,onSuccess: @escaping (Entities) -> Void, onError: errorClosure) {
        let session = URLSession.shared
        let urlString:String
        if(type == Type.shop.rawValue){
            urlString = URL_CONSTANTS.urlGETShops
        }else{
            urlString = URL_CONSTANTS.urlGETActivities
        }
        if let url = URL(string: urlString){
            let task = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
                OperationQueue.main.addOperation {
                    assert(Thread.current == Thread.main) // Para depurar si no conincide me tira
                    if error == nil{
                        // OK
                        let entities = parseEntities(data: data!)
                        onSuccess(entities)
                    }else{
                        // Error
                        if let myError = onError{
                            myError(error!)
                        }
                    }
                }
                
            }
            task.resume()
        }
    }
    
    func execute(type: String?,onSuccess: @escaping (Entities) -> Void) {
        execute(type: type,onSuccess: onSuccess, onError: nil)
    }
    
    
}

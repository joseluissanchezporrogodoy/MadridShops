//
//  DownloadAllShopsInteractorNSURLSessionImpl.swift
//  MadridShops
//
//  Created by jose luis sanchez-porro godoy on 12/09/2017.
//  Copyright © 2017 jose luis sanchez-porro godoy. All rights reserved.
//

import Foundation

class DownloadAllShopsInteractorNSURLSessionImpl: DownloadAllShopsInteractor {
    func execute(onSuccess: @escaping (Shops) -> Void, onError: errorClosure) {
        let session = URLSession.shared
        if let url = URL(string: URL_CONSTANTS.urlGETShops){
            let task = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
                OperationQueue.main.addOperation {
                    assert(Thread.current == Thread.main) // Para depurar si no conincide me tira
                    if error == nil{
                        // OK
                        let shops = parseShops(data: data!)
                        onSuccess(shops)
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
    
    func execute(onSuccess: @escaping (Shops) -> Void) {
        execute(onSuccess: onSuccess, onError: nil)
    }
    
    
}

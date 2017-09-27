//
//  DownloadAllShopsInteractor.swift
//  MadridShops
//
//  Created by jose luis sanchez-porro godoy on 07/09/2017.
//  Copyright © 2017 jose luis sanchez-porro godoy. All rights reserved.
//

import Foundation

protocol DownloadAllInteractor {
    // execute: downloads all shops. Return on the main thread
    func execute(type: String?,onSuccess: @escaping (Entities) -> Void, onError: errorClosure)
    func execute(type: String?,onSuccess: @escaping (Entities) -> Void)
    
}

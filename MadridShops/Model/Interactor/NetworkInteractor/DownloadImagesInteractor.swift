//
//  DownloadImagesInteractor.swift
//  MadridShops
//
//  Created by jose luis sanchez-porro godoy on 24/09/2017.
//  Copyright © 2017 jose luis sanchez-porro godoy. All rights reserved.
//

import Foundation


protocol DownloadImagesInteractor {
    func execute(entities: Entities,onSuccess: @escaping (Entities) -> Void, onError: errorClosure)
    func execute(entities: Entities, onSuccess: @escaping (Entities) -> Void)
}

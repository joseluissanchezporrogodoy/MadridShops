//
//  String+Image.swift
//  MadridShops
//
//  Created by jose luis sanchez-porro godoy on 12/09/2017.
//  Copyright © 2017 jose luis sanchez-porro godoy. All rights reserved.
//

import UIKit

extension String {
    func loadImage(into imageView: UIImageView){
        let queue = OperationQueue()
        queue.addOperation {
            // Hago en segundo plano
            if let url = URL(string: self),
                let data = NSData(contentsOf: url),
                let image = UIImage(data: data as Data){
                OperationQueue.main.addOperation {
                    // Hago en primer plano
                    imageView.image = image
                }
            }
        }
    }
}

//
//  String+Float.swift
//  MadridShops
//
//  Created by jose luis sanchez-porro godoy on 21/09/2017.
//  Copyright © 2017 jose luis sanchez-porro godoy. All rights reserved.
//

import Foundation

public extension String {
    public func toFloat() -> Float? {
        return Float.init(self)
    }
    
    public func toDouble() -> Double? {
        return Double.init(self)
    }
}

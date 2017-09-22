//
//  Double+String.swift
//  MadridShops
//
//  Created by José Luis Sánchez-Porro Godoy on 22/9/17.
//  Copyright © 2017 jose luis sanchez-porro godoy. All rights reserved.
//

import Foundation
extension Double {
    func toString() -> String {
        return String(format: "%f",self)
    }
}

//
//  SetExecutedOnceInteractorImpl.swift
//  MadridShops
//
//  Created by José Luis Sánchez-Porro Godoy on 19/9/17.
//  Copyright © 2017 jose luis sanchez-porro godoy. All rights reserved.
//

import Foundation

class SetExecutedOnceInteractorImpl: SetExecutedOnceInteractor {
    
    func execute() {
        let defaults = UserDefaults.standard
        
        defaults.set("SAVED", forKey: "once")
        
        defaults.synchronize()
    }
    
    
}

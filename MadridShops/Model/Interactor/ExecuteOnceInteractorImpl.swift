//
//  ExecuteOnceInteractorImpl.swift
//  MadridShops
//
//  Created by José Luis Sánchez-Porro Godoy on 19/9/17.
//  Copyright © 2017 jose luis sanchez-porro godoy. All rights reserved.
//

import Foundation

class ExecuteOnceInteractorImpl: ExecuteOnceInteractor {
   
     func execute( closureFirstTime:() -> Void, closureNoFirstTime: ()-> Void) {
        let defaults = UserDefaults.standard
        if let _ = defaults.string(forKey: "once"){
            closureNoFirstTime()
        }else{ // first time
            closureFirstTime()
        }
    }
}

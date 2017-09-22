//
//  ExecuteOnceInteractor.swift
//  MadridShops
//
//  Created by José Luis Sánchez-Porro Godoy on 19/9/17.
//  Copyright © 2017 jose luis sanchez-porro godoy. All rights reserved.
//

import Foundation

import Foundation

protocol ExecuteOnceInteractor {
    func execute( closureFirstTime:() -> Void, closureNoFirstTime: ()-> Void)
}

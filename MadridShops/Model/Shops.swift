//
//  Shops.swift
//  MadridShops
//
//  Created by jose luis sanchez-porro godoy on 07/09/2017.
//  Copyright © 2017 jose luis sanchez-porro godoy. All rights reserved.
//

import Foundation

// Se puede generalizar, tener en cuenta para la practica que se haga con shops y con todo
// Podríamos hacerlo fuera

protocol ShopsProtocol {
    func count() -> Int
    func add(shop: Shop)
    func get(index: Int) -> Shop
}
// Lo hago público para verlo desde fuera, en concreto en los test
public class Shops: ShopsProtocol{
   
    private var shopsList: [Shop]?
   
    public init() {
        self.shopsList = []
    }
    public func count() -> Int {
        return (shopsList?.count)!
    }
    
    public func add(shop: Shop) {
        shopsList?.append(shop)
    }
    
    public func get(index: Int) -> Shop {
        //lógica del índice si esta dentro de los márgenes
     
        return (shopsList?[index])!
    }
    
   
}


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

protocol EntitiesProtocol {
    func count() -> Int
    func add(entity: Entity)
    func get(index: Int) -> Entity
}
// Lo hago público para verlo desde fuera, en concreto en los test
public class Entities: EntitiesProtocol{
   
    private var entityList: [Entity]?
   
    public init() {
        self.entityList = []
    }
    public func count() -> Int {
        return (entityList?.count)!
    }
    
    public func add(entity: Entity) {
        entityList?.append(entity)
    }
    
    public func get(index: Int) -> Entity {
        //lógica del índice si esta dentro de los márgenes
     
        return (entityList?[index])!
    }
    
   
}


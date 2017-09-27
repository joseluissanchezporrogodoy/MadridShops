//
//  ShopsTest.swift
//  MadridShopsTests
//
//  Created by jose luis sanchez-porro godoy on 07/09/2017.
//  Copyright © 2017 jose luis sanchez-porro godoy. All rights reserved.
//

import XCTest
//@testable import MadridShops
import MadridShops

class ShopsTest: XCTestCase {
    
    func testGivenEmptyShopsNumberShopsIsZero(){
        let sut = Entities()
        XCTAssertEqual(0, sut.count())
    }
    func testGivenEmptyShopsWithOneElementNumberShopsIsOne(){
        //sut (system under test)
        let sut = Entities()
        sut.add(shop: Entity(name:"Shop"))
        XCTAssertEqual(1, sut.count())
    }
    
    
}

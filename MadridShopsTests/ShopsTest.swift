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
        let sut = Shops()
        XCTAssertEqual(0, sut.count())
    }
    func testGivenEmptyShopsWithOneElementNumberShopsIsOne(){
        //sut (system under test)
        let sut = Shops()
        sut.add(shop: Shop(name:"Shop"))
        XCTAssertEqual(1, sut.count())
    }
    
    
}

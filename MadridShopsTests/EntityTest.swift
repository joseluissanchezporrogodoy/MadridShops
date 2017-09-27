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

class EntityTest: XCTestCase {
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    func testEntityCreation(){
        let shop = Entity(name: "Shop 1")
        XCTAssertNotNil(shop)
    }
    func testEntitiesCreation(){
        let sut = Entities()
        XCTAssertNotNil(sut)
    }
    
    func testGivenEmptyNumberEntitiesIsZero(){
        let sut = Entities()
        XCTAssertEqual(0, sut.count())
    }
    func testGivenEmptyNumberEntitiesIsOne(){
        let sut = Entities()
        let shop = Entity(name: "Shop 1")
        sut.add(shop: shop)
        XCTAssertEqual(1, sut.count())
    }
    
    func testGivenEmptyEntitiesWithOneElementNumberEntitiesIsOne(){
        //sut (system under test)
        let sut = Entities()
        sut.add(shop: Entity(name:"Shop"))
        XCTAssertEqual(1, sut.count())
    }
    
    
}

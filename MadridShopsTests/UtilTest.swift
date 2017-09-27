//
//  UtilTest.swift
//  MadridShopsTests
//
//  Created by jose luis sanchez-porro godoy on 27/09/2017.
//  Copyright © 2017 jose luis sanchez-porro godoy. All rights reserved.
//

import XCTest
@testable import MadridShops
class UtilTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testStringToDoubleConversion() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let double = "40.4520,478 "
        let result:Double = 40.4520478
         XCTAssertEqual(double.toDouble(), result)
    }
    func testDoubleToStringConversion() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let double = "40.4520478"
        let result:Double = 40.4520478
        XCTAssertEqual(double.toDouble(), result)
    }
    
    func testMapImageURL() {
        let entity = Entity(name: "Prueba")
        entity.latitude = 40.452
        entity.longitude = 40.452
        let result = "https://maps.googleapis.com/maps/api/staticmap?25&size=320x220&scale=2&markers=40.452000,40.452000"
        XCTAssertEqual(getURLImageMapFromEntity(entity: entity), result)
        
    }
    
}

//
//  AssertYourselfTests.swift
//  AssertYourselfTests
//
//  Created by Mira Yang on 5/18/22.
//

import XCTest
@testable import AssertYourself

struct StructWithDescription: CustomStringConvertible {
    let x: Int
    let y: Int
    var description: String {"\(x), \(y)"}
}

class AssertYourselfTests: XCTestCase {

    func test_fail(){
        XCTFail("Problem here")
    }
    
    func test_assetNil() {
        let value: Int? = 1
        XCTAssertNil(value)
    }
    
    func test_assetNil_withSelfDescribingType(){
        let value: StructWithDescription? = StructWithDescription(x: 1, y: 2)
        XCTAssertNil(value)
    }
    
    func test_assertEqual() {
        let actual = "actual"
        XCTAssertEqual(actual, "expected")
    }
    
    func test_assertEqual_withOptionals(){
        let actual: String? = "actual"
        XCTAssertEqual(actual, "expected")
    }
    
    func test_floatingPointDanger(){
        let result = 0.1 + 0.2
        XCTAssertEqual(result, 0.3)
    }
    
    func test_floatingPointFixed() {
        let result = 0.1 + 0.2
        XCTAssertEqual(result, 0.3, accuracy: 0.0001)
    }
}

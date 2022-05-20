//
//  MyClassTests.swift
//  LifeCyclesTests
//
//  Created by Mira Yang on 5/19/22.
//

@testable import LifeCycles
import XCTest

class MyClassTests: XCTestCase {
    private var sut : MyClass!
    
    override func setUp() {
        super.setUp()
        sut = MyClass()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_methodOne(){
        sut.methodOne()
        // normally, assert something
    }
    
    func test_methodTwo() {
        sut.methodTwo()
        // normally, assert something
    }
}


//
//  TDDLearningDemoTests.swift
//  TDDLearningDemoTests
//
//  Created by 沈海超 on 2021/6/19.
//

import XCTest
@testable import TDDLearningDemo

class TDDLearningDemoTests: XCTestCase {

    var vc: ViewController!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        vc = ViewController()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample1() throws {
        
        let str = "welcome to the world"
        let headLine = vc.makeHeadline(string: str)
        XCTAssertEqual(headLine, "Welcome To The World")
    }

    func testExample2() throws {
        
        let str = "here is another example"
        let headLine = vc.makeHeadline(string: str)
        XCTAssertEqual(headLine, "Here Is Another Example")
    }
    
    func testExample3() throws {
        
        let inputString = "here is another example"
        let expectedHeadline = "Here Is Another Example"
        
        let result = vc.makeHeadline(string: inputString)
        XCTAssertEqual(result, expectedHeadline)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    
    func testFeed() {
        let cat = MockPet()
        let james = Person(pet: cat, foodName: "小鱼干")
        james.feed()
        XCTAssertTrue(cat.wasFeed, "james should have feed his cat")
    }

}





//
//  PerformerceTests.swift
//  TDDLearningDemoTests
//
//  Created by 沈海超 on 2021/6/27.
//

import XCTest

class PerformerceTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure(metrics: [XCTClockMetric(),XCTCPUMetric(),XCTStorageMetric(),XCTMemoryMetric()]) {
            let result = self.fib2(40)
            print(result)
        }
    }
    
    
    // o(2^n) 0 1 1 2 3 ..N
    func fib1(_ n: Int) -> Int {
        if n <= 1 {
            return n
        }
        return fib1(n - 1) + fib1(n - 2)
    }
    
    // o(n)
    func fib2(_ n: Int) -> Int {
        if (n <= 1) {
            return n
        }
        
        var first = 0
        var second = 1
        for _ in 0..<n - 1 {
            let sum = first + second
            first = second
            second = sum
        }
        return second
    }
}

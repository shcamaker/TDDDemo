//
//  SessionStubTests.swift
//  TDDLearningDemoTests
//
//  Created by 沈海超 on 2021/6/27.
//

import XCTest
@testable import TDDLearningDemo

class SessionStubTests: XCTestCase {
    
    var vm: ViewModel?
    

    override func setUpWithError() throws {
        vm = ViewModel()
    }

    override func tearDownWithError() throws {
        vm = nil
    }

    func testExample() throws {
        
        let str = "https://www.xxxxxxxxxxxx"
        guard let url = URL(string: str) else { return }
        vm?.getData(url: url, result: { result in
             XCTAssertNil(result, "no result")
        })

    }
    
    func testStubData() {
        // given
        // 1
        let stubbedData = "[1]".data(using: .utf8)
        let str = "https://www.jianshu.com/u/02d76422b530"
        guard let url = URL(string: str) else { return }
        let stubbedResponse = HTTPURLResponse(
          url: url,
          statusCode: 200,
          httpVersion: nil,
          headerFields: nil)
        let urlSessionStub = URLSessionStub(
          data: stubbedData,
          response: stubbedResponse,
          error: nil)
        
        let promise = expectation(description: "Completion handler invoked")

        // when
        vm?.session = urlSessionStub
        vm?.getData(url: url) { result in
            XCTAssertEqual(result, 1)
            promise.fulfill()
        }
        
        wait(for: [promise], timeout: 5)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure(metrics: [XCTClockMetric(),XCTCPUMetric(),XCTStorageMetric(),XCTMemoryMetric()]) {
            
        }
    }

}

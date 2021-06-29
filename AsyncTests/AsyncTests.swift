//
//  AsyncTests.swift
//  AsyncTests
//
//  Created by 沈海超 on 2021/6/24.
//

import XCTest
@testable import TDDLearningDemo

class AsyncTests: XCTestCase {

    var session: URLSession!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        session = URLSession(configuration: .default)
    }

    override func tearDownWithError() throws {
        session = nil
        try super.tearDownWithError()
    }
    
    // Asynchronous test: success fast, failure slow
    func testValidRequestGetsHTTPStatusCode200() throws {
      // given
      let urlString =
        "https://www.jianshu.com/u/02d76422b530"
      let url = URL(string: urlString)!
      // 1
      let promise = expectation(description: "Status code: 200")

      // when
      let dataTask = session.dataTask(with: url) { _, response, error in
        // then
        if let error = error {
          XCTFail("Error: \(error.localizedDescription)")
          return
        } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
          if statusCode == 200 {
            // 2
            promise.fulfill()
          } else {
            XCTFail("Status code: \(statusCode)")
          }
        }
      }
      dataTask.resume()
      // 3
      wait(for: [promise], timeout: 5)
    }
    
    func testApiCallCompletes() throws {
      // given
//      let urlString = "https://www.jianshu.com/u/02d76422b530"
        let urlString = "https://www.jianshu.com/u/02d76422b530test"
      let url = URL(string: urlString)!
      let promise = expectation(description: "Completion handler invoked")
      var statusCode: Int?
      var responseError: Error?

      // when
      let dataTask = session.dataTask(with: url) { _, response, error in
        statusCode = (response as? HTTPURLResponse)?.statusCode
        responseError = error
        promise.fulfill()
      }
      dataTask.resume()
      wait(for: [promise], timeout: 5)

      // then
      XCTAssertNil(responseError)
      XCTAssertEqual(statusCode, 200)
    }



    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

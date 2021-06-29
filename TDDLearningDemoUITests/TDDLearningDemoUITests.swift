//
//  TDDLearningDemoUITests.swift
//  TDDLearningDemoUITests
//
//  Created by 沈海超 on 2021/6/19.
//

import XCTest

class TDDLearningDemoUITests: XCTestCase {
    var app: XCUIApplication!
    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false

        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        
        //given
        let firstBtn = app/*@START_MENU_TOKEN@*/.segmentedControls.buttons["First"]/*[[".segmentedControls.buttons[\"First\"]",".buttons[\"First\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/
        let secondBtn = app/*@START_MENU_TOKEN@*/.buttons["Second"]/*[[".segmentedControls.buttons[\"Second\"]",".buttons[\"Second\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let firstLabel = app.staticTexts["first"]
        let secondLabel = app.staticTexts["second"]
        
        //then
        if firstBtn.isSelected {
          XCTAssertTrue(firstLabel.exists)
          XCTAssertFalse(secondLabel.exists)
          
          secondBtn.tap()
          XCTAssertTrue(secondLabel.exists)
          XCTAssertFalse(firstLabel.exists)
        } else if secondBtn.isSelected {
          XCTAssertTrue(secondLabel.exists)
          XCTAssertFalse(firstLabel.exists)
          
          firstBtn.tap()
          XCTAssertTrue(firstLabel.exists)
          XCTAssertFalse(secondLabel.exists)
        }
        
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}

//
//  StubAndMock.swift
//  TDDLearningDemo
//
//  Created by 沈海超 on 2021/6/25.
//

import UIKit

class BodyHelper {
    @objc func getResultWith(height: Float, weight: Float) -> Float {
        return 0
    }
//    func stub(selector: Selector, andResult: Float, withArguments: Float...) {
//
//    }
}

class Reposity {
    var bodyHelper = BodyHelper()
    func saveResultWith(height: Float, weight: Float) {
        let result = bodyHelper.getResultWith(height: height, weight: weight)
        self.save(result: result)
    }
    func save(result: Float) {
        
    }
    
//    func testSaveResult() {
//        let height: Float = 180
//        let weight: Float = 147
//
//        let mockResult: Float = 0
//        bodyHelper.stub(selector: #selector(bodyHelper.getResultWith(height:weight:)), andResult: mockResult, withArguments: height, weight)
//
//    }
}

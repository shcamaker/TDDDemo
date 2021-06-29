//
//  SubjectListVM.swift
//  TDDLearningDemo
//
//  Created by 沈海超 on 2021/6/20.
//

import UIKit

enum SubjectType: Int {
    case arts
    case science
    case none
}

struct Subject {
    var name: String
    var type: SubjectType
    func typeString() -> String {
        switch type {
        case .arts:
            return "arts"
        case .science:
            return "science"
        default:
            return "none"
        }
    }
}

class SubjectListVM: NSObject {
    static func getSubjects() -> [Subject] {
        return [
            Subject(name: "语文", type: .arts),
            Subject(name: "数学", type: .science),
            Subject(name: "物理", type: .science),
            Subject(name: "历史", type: .arts)
        ]
    }
}





//
//  SubjectListSpec.swift
//  TDDLearningDemoTests
//
//  Created by 沈海超 on 2021/6/20.
//

import UIKit
import Quick
import Nimble

@testable import TDDLearningDemo

class SubjectListSpec: QuickSpec {

    override func spec() {
        
        var subjectListVC: SubjectListVC!
        describe("subject list viewController") {
            beforeEach {
                subjectListVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "SubjectListVC")
                _ = subjectListVC.view // 将视图控制器放入内存中，相当于调用viewDidLoad
            }
            // Test #1 – 期望TableView Rows Count = Subjects Data Count
            context("when the view is loaded") {
                it("should have 4 subjects loaded") {
                    expect(subjectListVC.tableView.numberOfRows(inSection: 0)).to(equal(4))
                }
            }
            // Test #2 – 期望显示真实的学科数据
            context("tableView") {
                var cell: UITableViewCell!
                beforeEach {
                        cell = subjectListVC.tableView(subjectListVC.tableView, cellForRowAt: IndexPath(row: 0, section: 0))
                }
                it("should show subject name and type") {
                    expect(cell.textLabel?.text).to(equal("语文"))
                    expect(cell.detailTextLabel?.text).to(equal("arts"))
                 }
            }
        }
        
    }
}

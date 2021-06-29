//
//  SubjectListVC.swift
//  TDDLearningDemo
//
//  Created by 沈海超 on 2021/6/20.
//

import UIKit

class SubjectListVC: UITableViewController {

    var subjects: [Subject] {
        SubjectListVM.getSubjects()
    }
    
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return subjects.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
        let subject = subjects[indexPath.row]
        cell.textLabel?.text = subject.name
        cell.detailTextLabel?.text = subject.typeString()

        return cell
    }
}

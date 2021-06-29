//
//  ViewController.swift
//  TDDLearningDemo
//
//  Created by 沈海超 on 2021/6/19.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    @IBAction func changeLabelText(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            targetLabel.text = "first"
        case 1:
            targetLabel.text = "second"
        default:
            break
        }
    }
    
    
    func makeHeadline(string: String) -> String {

        let words = string.components(separatedBy: " ")

        let headline = words.map { word in
            var word = word
            let firstCharacter = word.remove(at: word.startIndex)
            return "\(firstCharacter.uppercased())\(word)"
        }.joined(separator: " ")

        return headline
    }
    
//    func makeHeadline(string: String) -> String {
//
//        let words = string.components(separatedBy: " ")
//
//        var headline = ""
//        for var word in words {
//            let firstCharacter = word.remove(at: word.startIndex)
//            headline += "\(firstCharacter.uppercased())\(word) "
//        }
//
//        headline.removeLast()
//        return headline
//    }

//    func makeHeadline(string: String) -> String {
//        return "Welcome To The World"
//    }
    
//    func makeHeadline(string: String) -> String {
//
//        return "Welcome To The World"
//    }

}



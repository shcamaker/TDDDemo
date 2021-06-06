//
//  GameDoneViewController.swift
//  Numero
//
//  Created by 沈海超 on 2021/6/6.
//  Copyright © 2021 Facebook. All rights reserved.
//

import UIKit

class GameDoneViewController: UIViewController {

  @IBOutlet weak var scoreLabel: UILabel!
  
  var score: Int?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if let finalScore = score {
      scoreLabel.text = "Your final score: \(finalScore)"
    }
  }
    
  @IBAction func playAgainPressed(_ sender: Any) {
    presentingViewController?.dismiss(animated: true, completion: nil)
  }


}

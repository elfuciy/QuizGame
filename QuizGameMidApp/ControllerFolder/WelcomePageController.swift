//
//  ViewController.swift
//  QuizGameMidApp
//
//  Created by Elsever on 30.12.24.
//

import UIKit

class WelcomePageController: UIViewController {


    @IBOutlet weak var bigText: UILabel!
    @IBOutlet weak var littleText: UILabel!

    
    var boldText = ""
    var colorConfigure = ColorConfigurations()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorConfigure.backgroundColor(view)
   
        bigText.text = "Welcome \n to FunQuiz Game!"
        littleText.text = "Play, Learn, and Explore with Exciting Quizzes!"
    }

    @IBAction func getStarted(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(identifier: "LoginController") as! LoginController
        navigationController?.pushViewController(controller, animated: true)
    }
    
}


//
//  QuizController.swift
//  QuizGameMidApp
//
//  Created by Elsever on 01.01.25.
//

import UIKit

class QuizController: UIViewController {

    @IBOutlet weak var buttonView: UIView!
    @IBOutlet weak var buttonViewShade: UIView!
    @IBOutlet weak var questionNum: UILabel!
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var firstOptionView: UIView!
    @IBOutlet weak var firstOptionViewShade: UIView!
    @IBOutlet weak var secondOptionView: UIView!
    @IBOutlet weak var secondOptionViewShade: UIView!
    @IBOutlet weak var thirdOptionView: UIView!
    @IBOutlet weak var thirdOptionViewShade: UIView!
    @IBOutlet weak var firstOption: UILabel!
    @IBOutlet weak var secondOption: UILabel!
    @IBOutlet weak var thirdOption: UILabel!
    
    var questions = QuestionDataClass(context: AppDelegate().persistentContainer.viewContext)
    var options = OptionsDataClass(context: AppDelegate().persistentContainer.viewContext)
    var optionsArray = [OptionsData]()
    var questionArray = [Questions]()
    var count = 0
    var timer: Timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        ColorConfigurations().backgroundColor(view)
        
        questions.fetching { question in
            questionArray = question
        }
        
        options.fetch { options in
            optionsArray = options
        }

        quizStart(category: "Sport Quiz")
    }
    

    @IBAction func firstSelected(_ sender: Any) {
        answerReveal(answer: optionsArray[count].options ?? "")
    }
    
    @IBAction func secondSelected(_ sender: Any) {
        answerReveal(answer: optionsArray[count].option2 ?? "")

    }
    @IBAction func thirdSelected(_ sender: Any) {
        answerReveal(answer: optionsArray[count].option3 ?? "")

    }

}

extension QuizController {
    func configure() {
        buttonView.isHidden = true
        buttonViewShade.isHidden = true
    }
    
    func quizStart(category: String) {
        questionNum.text = "Question \(count + 1) of \(questionArray.count)"
        if questionArray[count].category == category && optionsArray[count].category == category {
            question.text = questionArray[count].question
            firstOption.text = optionsArray[count].options
            secondOption.text = optionsArray[count].option2
            thirdOption.text = optionsArray[count].option3
        }
        print(question.text ?? "")
        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(doThis), userInfo: nil, repeats: false)
        reset()
    }
    
    @objc func doThis() {
        if !questionArray[count].isAnswered {
            questionArray[count].isAnswered = true
            firstOptionView.isHidden = true
            firstOptionViewShade.isHidden = true
            thirdOptionView.isHidden = true
            thirdOptionViewShade.isHidden = true
            buttonView.isHidden = false
            buttonViewShade.isHidden = false
            secondOptionView.isUserInteractionEnabled = false
            count += 1
        }
        
    }
    
    @IBAction func nextQuestion(_ sender: Any) {
        if count <= questionArray.count {
            quizStart(category: "Sport Quiz")
        }
    }
    
    func answerReveal(answer: String) {
        if answer == questionArray[count].answer {
            firstOptionView.isHidden = true
            firstOptionViewShade.isHidden = true
            thirdOptionView.isHidden = true
            thirdOptionViewShade.isHidden = true
            secondOption.textColor = UIColor.green
            secondOption.text = "Correct"
            questionArray[count].isAnswered = true
            buttonView.isHidden = false
            buttonViewShade.isHidden = false
            count += 1

        } else {
            firstOptionView.isHidden = true
            firstOptionViewShade.isHidden = true
            thirdOptionView.isHidden = true
            thirdOptionViewShade.isHidden = true
            secondOption.textColor = UIColor.red
            secondOption.text = "Wrong"
            questionArray[count].isAnswered = true
            buttonView.isHidden = false
            buttonViewShade.isHidden = false
            count += 1

        }
        timer.invalidate()
        secondOptionView.isUserInteractionEnabled = false

    }
    
    func reset() {
        firstOptionView.isHidden = false
        firstOptionViewShade.isHidden = false
        thirdOptionView.isHidden = false
        thirdOptionViewShade.isHidden = false
        secondOptionView.isUserInteractionEnabled = true
        buttonView.isHidden = true
        buttonViewShade.isHidden = true
        secondOption.textColor = UIColor.label
    }
}

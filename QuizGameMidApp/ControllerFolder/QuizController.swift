//
//  QuizController.swift
//  QuizGameMidApp
//
//  Created by Elsever on 01.01.25.
//

import UIKit
import CoreData

class QuizController: UIViewController {
    @IBOutlet private weak var buttonView: UIView!
    @IBOutlet private weak var buttonViewShade: UIView!
    @IBOutlet private weak var questionNum: UILabel!
    @IBOutlet private weak var question: UILabel!
    @IBOutlet private weak var firstOptionView: UIView!
    @IBOutlet private weak var firstOptionViewShade: UIView!
    @IBOutlet private weak var secondOptionView: UIView!
    @IBOutlet private weak var secondOptionViewShade: UIView!
    @IBOutlet private weak var thirdOptionView: UIView!
    @IBOutlet private weak var thirdOptionViewShade: UIView!
    @IBOutlet private weak var firstOption: UILabel!
    @IBOutlet private weak var secondOption: UILabel!
    @IBOutlet private weak var thirdOption: UILabel!
    @IBOutlet private weak var timeLabel: UILabel!
    @IBOutlet private weak var barView: UIView!
    @IBOutlet private weak var coinImage: UIImageView!
    @IBOutlet private weak var pointLabel: UILabel!
    
    var context = AppDelegate().persistentContainer.viewContext

    var questions = QuestionDataClass(context: AppDelegate().persistentContainer.viewContext)
    var options = OptionsDataClass(context: AppDelegate().persistentContainer.viewContext)
    var category = CategoryData(context: AppDelegate().persistentContainer.viewContext)
    
    var modelView = QuizControllerModelView()
    var helper = FileManagerHelper()
    
    var time = 30
    var endTimer: Timer = Timer()
    var timer: Timer = Timer()
    let username = UserDefaults.standard.string(forKey: "username")
    
    var callBack: (([QuizCategory], [UserModel]) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        modelView.getData()
        quizStart()
        configure()
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(endQuiz))
    }
    
    func configure() {
        ColorConfigurations().circleSecond(view: barView, percent: 100)
        ColorConfigurations().backgroundColor(view)
        coinImage.image = UIImage(named: "coin3")
        buttonView.isHidden = true
        buttonViewShade.isHidden = true
        timeLabel.text = "\(time)"
        pointLabel.text = "\(modelView.userArray[0].point ?? 0)"
    }
    
    @objc func timeCounter() {
        time -= 1
        let percent = (Double(time) / 30) * 2
        timeLabel.text = "\(time)"
        ColorConfigurations().circleSecond(view: barView, percent: percent)
    }
    
    func quizStart() {
        let category = modelView.selectedCategory ?? ""
        if modelView.answeredQuestionsNum == 20 {
            showEndAlert()
        } else {
            questionNum.text = "Question \(modelView.answeredQuestionsNum + 1) of \(modelView.questionArray.count)"
            if modelView.questionArray[modelView.answeredQuestionsNum].category == category && modelView.optionsArray[modelView.answeredQuestionsNum].category == category {
                question.text = modelView.questionArray[modelView.answeredQuestionsNum].question
                firstOption.text = modelView.optionsArray[modelView.answeredQuestionsNum].options
                secondOption.text = modelView.optionsArray[modelView.answeredQuestionsNum].option2
                thirdOption.text = modelView.optionsArray[modelView.answeredQuestionsNum].option3
            }
            reset()
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timeCounter), userInfo: nil, repeats: true)
            endTimer = Timer.scheduledTimer(timeInterval: 30, target: self, selector: #selector(doThis), userInfo: nil, repeats: false)
          
        }
    }
    
    @objc func endQuiz() {
        if !buttonView.isHidden {
            modelView.answeredQuestionsNum += 1
            modelView.category.updateCategoryPercent(percent: modelView.calculate(),
                                                     filterText: modelView.selectedCategory ?? "",
                                                     count: Int16(modelView.answeredQuestionsNum))
        }
        modelView.getData()
        callBack?(modelView.categoryArray, modelView.userArray)
        navigationController?.popViewController(animated: true)
    }
    
    func showEndAlert() {
        let alert = UIAlertController(title: "Quiz finished", message: "You have completed \(modelView.questionArray.count) questions", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            self.navigationController?.popViewController(animated: true)
        }))
        present(alert, animated: true, completion: nil)
    }

    @IBAction func firstSelected(_ sender: Any) {
        answerReveal(answer: modelView.optionsArray[modelView.answeredQuestionsNum].options ?? "")
    }
    
    @IBAction func secondSelected(_ sender: Any) {
        answerReveal(answer: modelView.optionsArray[modelView.answeredQuestionsNum].option2 ?? "")
    }
    
    @IBAction func thirdSelected(_ sender: Any) {
        answerReveal(answer: modelView.optionsArray[modelView.answeredQuestionsNum].option3 ?? "")
    }
    
    @IBAction func nextQuestion(_ sender: Any) {
        if modelView.answeredQuestionsNum < modelView.questionArray.count - 1 {
            time = 30
            modelView.answeredQuestionsNum += 1
            quizStart()
        } else {
            modelView.answeredQuestionsNum += 1
            showEndAlert()
        }
        modelView.category.updateCategoryPercent(percent: modelView.calculate(),
                                                 filterText: modelView.selectedCategory ?? "",
                                                 count: Int16(modelView.answeredQuestionsNum))
    }
}

extension QuizController {
    @objc func doThis() {
        hide()
        buttonView.isHidden = false
        buttonViewShade.isHidden = false
        secondOptionView.isUserInteractionEnabled = false
        secondOption.textColor = UIColor.red
        secondOption.text = modelView.questionArray[modelView.answeredQuestionsNum].answer
        timer.invalidate()
    }
    
    func answerReveal(answer: String) {
        if answer == modelView.questionArray[modelView.answeredQuestionsNum].answer {
            hide()
            secondOption.textColor = UIColor.green
            secondOption.text = "Correct"
            buttonView.isHidden = false
            buttonViewShade.isHidden = false
            modelView.countPoints()
            modelView.helper.updatePoints(points: Int(modelView.points))
            print("true: \(modelView.points)")
        } else {
            hide()
            secondOption.textColor = UIColor.red
            secondOption.text = "Wrong"
            buttonView.isHidden = false
            buttonViewShade.isHidden = false
            print("false")
        }
        endTimer.invalidate()
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
    
    func hide() {
        firstOptionView.isHidden = true
        firstOptionViewShade.isHidden = true
        thirdOptionView.isHidden = true
        thirdOptionViewShade.isHidden = true
    }
}

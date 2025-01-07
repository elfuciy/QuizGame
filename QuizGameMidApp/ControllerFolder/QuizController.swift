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
    
    var context = AppDelegate().persistentContainer.viewContext

    var questions = QuestionDataClass(context: AppDelegate().persistentContainer.viewContext)
    var options = OptionsDataClass(context: AppDelegate().persistentContainer.viewContext)
    var category = CategoryData(context: AppDelegate().persistentContainer.viewContext)
    var helper = FileManagerHelper()
    var optionsArray = [OptionsData]()
    var questionArray = [Questions]()
    var selectedCategory: String?
    var count = 0
    var percent: Double = 0
    var points: Int16 = 0
    var timer: Timer = Timer()
    var userArray = [UserModel]()
    var callBack: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        getData()
//        check()
        quizStart(category: selectedCategory ?? "")
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(endQuiz))
    }
    
    @objc func endQuiz() {
        callBack?()
        navigationController?.popViewController(animated: true)
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
    
    func getData() {
        questions.fetching { question in
            questionArray = question.filter { $0.category == selectedCategory}
            questionArray.sort { $0.id < $1.id }
        }
        
        options.fetch { options in
            optionsArray = options.filter { $0.category == selectedCategory}
        }
        
        category.fetch { category in
            count = Int(category.filter { $0.category == selectedCategory && $0.user == UserDefaults.standard.string(forKey: "username")}.first?.countNum ?? 0)
        }
        
        helper.readData(completion: { user in
            userArray = user
        })
        
    }
    
    func configure() {
        ColorConfigurations().backgroundColor(view)
        buttonView.isHidden = true
        buttonViewShade.isHidden = true
    }
    
//    func check() {
//        while questionArray[count].isAnswered {
//            count += 1
//        }
//    }
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
//    нужно обновить базу данных для сохранения isAnswered
//    можно задать в базе данных то сколько % уже сделано чтобы не выcчитывать каждый раз
    @objc func doThis() {
        hide()
        buttonView.isHidden = false
        buttonViewShade.isHidden = false
        secondOptionView.isUserInteractionEnabled = false
        secondOption.textColor = UIColor.red
        secondOption.text = questionArray[count].answer
        

    }
    
    @IBAction func nextQuestion(_ sender: Any) {
//        questions.updateQustion(filterText: questionArray[count].answer ?? "")
        category.updateCategoryPercent(percent: calculate(), filterText: selectedCategory ?? "", count: Int16(count + 1))
        helper.updatePoints(user: userArray, points: countPoints())
        count += 1
        if count <= questionArray.count {
            quizStart(category: selectedCategory ?? "")
        }
        
    }
    
    func answerReveal(answer: String) {
        if answer == questionArray[count].answer {
            hide()
            secondOption.textColor = UIColor.green
            secondOption.text = "Correct"
            buttonView.isHidden = false
            buttonViewShade.isHidden = false

        } else {
            hide()
            secondOption.textColor = UIColor.red
            secondOption.text = "Wrong"
            buttonView.isHidden = false
            buttonViewShade.isHidden = false
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
    
    func hide() {
        firstOptionView.isHidden = true
        firstOptionViewShade.isHidden = true
        thirdOptionView.isHidden = true
        thirdOptionViewShade.isHidden = true
    }
    
    func countPoints() -> Int {
        points += questionArray[count].poitns
        return Int(points)
    }
    
    func calculate() -> Double {
        percent = Double(count + 1) / Double(questionArray.count)
        print(percent)
        print(count)
        return percent
    }
}

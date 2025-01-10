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
    @IBOutlet private weak var barView: UIView!
        
    var context = AppDelegate().persistentContainer.viewContext

    var questions = QuestionDataClass(context: AppDelegate().persistentContainer.viewContext)
    var options = OptionsDataClass(context: AppDelegate().persistentContainer.viewContext)
    var category = CategoryData(context: AppDelegate().persistentContainer.viewContext)
    
    var helper = FileManagerHelper()
    var optionsArray = [OptionsData]()
    var questionArray = [Questions]()
    var userArray = [UserModel]()
    var categoryArray = [QuizCategory]()
    
    var selectedCategory: String?
    var count = 0 //number of questions were answered
    var percent: Double = 0
    var points: Int16 = 0
    var timer: Timer = Timer()
    
    var callBack: (([QuizCategory]) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        getData()
        quizStart()
        ColorConfigurations().circleSecond(view: barView)
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(endQuiz))
    }
    
    func configure() {
        ColorConfigurations().backgroundColor(view)
        buttonView.isHidden = true
        buttonViewShade.isHidden = true
    }
    
    func getData() {
        category.fetch { category in
            count = Int(category.filter { $0.category == selectedCategory && $0.user == UserDefaults.standard.string(forKey: "username")}.first?.countNum ?? 0)
            categoryArray = category.filter { $0.user == UserDefaults.standard.string(forKey: "username")}
        }
        
        questions.fetching { question in
            questionArray = question.filter { $0.category == selectedCategory}
            questionArray.sort { $0.id < $1.id }
        }
        
        options.fetch { options in
            optionsArray = options.filter { $0.category == selectedCategory}
        }
        
        helper.readData(completion: { user in
            userArray = user
        })
    }
    
    func quizStart() {
        let category = selectedCategory ?? ""
        if count == 20 {
            let alert = UIAlertController(title: "Quiz finished", message: "You have completed \(questionArray.count) questions", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                self.navigationController?.popViewController(animated: true)
            }))
            present(alert, animated: true, completion: nil)
        } else {
            questionNum.text = "Question \(count + 1) of \(questionArray.count)"
            if questionArray[count].category == category && optionsArray[count].category == category {
                question.text = questionArray[count].question
                firstOption.text = optionsArray[count].options
                secondOption.text = optionsArray[count].option2
                thirdOption.text = optionsArray[count].option3
            }
            timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(doThis), userInfo: nil, repeats: false)
            reset()
        }
    }
    
    @objc func endQuiz() {
//        updateData()
        getData()
        callBack?(categoryArray)
        navigationController?.popViewController(animated: true)
    }
    
    func updateData() {
        category.updateCategoryPercent(percent: calculate(),
                                       filterText: selectedCategory ?? "",
                                       count: Int16(count))
        helper.updatePoints(points: Int(points))
    }
    
    func showEndAlert() {
        let alert = UIAlertController(title: "Quiz finished", message: "You have completed \(questionArray.count) questions", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            self.navigationController?.popViewController(animated: true)
        }))
        present(alert, animated: true, completion: nil)
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
    
    @IBAction func nextQuestion(_ sender: Any) {
        if count < questionArray.count - 1 {
            count += 1
            quizStart()
        } else {
            showEndAlert()
        }
        updateData()
        print("points \(points)")
    }
}

extension QuizController {
    func warn() {
        if count == 20 {
            let alert = UIAlertController(title: "Quiz finished", message: "You have completed \(questionArray.count) questions", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                self.navigationController?.popViewController(animated: true)
            }))
            present(alert, animated: true, completion: nil)
        }
    }
    
//    func check() {
//        while questionArray[count].isAnswered {
//            count += 1
//        }
//    }
    
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
    
    func answerReveal(answer: String) {
        if answer == questionArray[count].answer {
            hide()
            secondOption.textColor = UIColor.green
            secondOption.text = "Correct"
            buttonView.isHidden = false
            buttonViewShade.isHidden = false
            countPoints()
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
    
    func countPoints() {
        points += questionArray[count].poitns
    }
    
    func calculate() -> Double {
//        let nums = count + 1
        percent = Double(count) / Double(questionArray.count)
        return percent
    }
}

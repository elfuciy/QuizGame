//
//  QuizController.swift
//  QuizGameMidApp
//
//  Created by Elsever on 01.01.25.
//

import UIKit
import CoreData

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
    
    var context = AppDelegate().persistentContainer.viewContext

    var questions = QuestionDataClass(context: AppDelegate().persistentContainer.viewContext)
    var options = OptionsDataClass(context: AppDelegate().persistentContainer.viewContext)
    var category = CategoryData(context: AppDelegate().persistentContainer.viewContext)
    var optionsArray = [OptionsData]()
    var questionArray = [Questions]()
    var categoryArray = [QuizCategory]()
    var count = 0
    var percent: Double = 0
    var timer: Timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        getData()
        check()
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
    
    func getData() {
        questions.fetching { question in
            questionArray = question
            questionArray.sort { $0.id < $1.id }
        }
        
        options.fetch { options in
            optionsArray = options
        }
    }
    
    func configure() {
        ColorConfigurations().backgroundColor(view)
        buttonView.isHidden = true
        buttonViewShade.isHidden = true
    }
    
    func check() {
        while questionArray[count].isAnswered {
            count += 1
        }
    }
    func quizStart(category: String) {
        if !questionArray[count].isAnswered {
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
        questionArray[count].isAnswered = true
        updating()
        upd()
        count += 1

    }
    
    @IBAction func nextQuestion(_ sender: Any) {
        if count <= questionArray.count {
            quizStart(category: "Sport Quiz")
        }
    }
    
    func answerReveal(answer: String) {
        if answer == questionArray[count].answer {
            hide()
            secondOption.textColor = UIColor.green
            secondOption.text = "Correct"
            questionArray[count].isAnswered = true
            buttonView.isHidden = false
            buttonViewShade.isHidden = false

        } else {
            hide()
            secondOption.textColor = UIColor.red
            secondOption.text = "Wrong"
            questionArray[count].isAnswered = true
            buttonView.isHidden = false
            buttonViewShade.isHidden = false
        }
        timer.invalidate()
        questionArray[count].isAnswered = true
        updating()
        upd()
        count += 1
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
    
    func updating() {
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "Questions")
            let predicate = NSPredicate(format: "question = '\(questionArray[count].question ?? "")'")
            fetchRequest.predicate = predicate
            do
            {
                let object = try context.fetch(fetchRequest)
                if object.count == 1
                {
                    let objectUpdate = object.first as! NSManagedObject
                    objectUpdate.setValue(true, forKey: "isAnswered")
                    do{
                        try context.save()
                    }
                    catch
                    {
                        print(error)
                    }
                }
            }
            catch
            {
                print(error)
            }
        questions.fetching { question in
            questionArray = question
            questionArray.sort { $0.id < $1.id }
        }
        print(questionArray[count].isAnswered)
    }
    
    func upd() {
//        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "QuizCategory")
//        let predicate = NSPredicate(format: "category = 'Sport Quiz'")
//        fetchRequest.predicate = predicate
        
//        do {
//            let object = try context.fetch(fetchRequest)
//            if object.count == 1
//            {
//                let objectUpdate = object.first as! NSManagedObject
//                objectUpdate.setValue(calculate(), forKey: "percent")
//                do {
//                    try context.save()
//                } catch {
//                    print(error)
//                }
//            }
//        } catch {
//            print(error)
//        }
        
        category.updateCategoryPercent(percent: calculate(), filterText: "Sport Quiz")
        
        category.fetch { category in
            categoryArray = category
            for index in 0..<categoryArray.count {
                print(categoryArray[index].percent)
            }
            
            print(calculate())
        }
    }
    
    func calculate() -> Double {
        percent = Double(count + 1) / Double(questionArray.count)
        return percent 
    }
}

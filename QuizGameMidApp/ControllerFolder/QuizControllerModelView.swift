//
//  QuizControllerModelView.swift
//  QuizGameMidApp
//
//  Created by Elsever on 19.01.25.
//

import Foundation
import UIKit
class QuizControllerModelView {
    var questions = QuestionDataClass(context: AppDelegate().persistentContainer.viewContext)
    var options = OptionsDataClass(context: AppDelegate().persistentContainer.viewContext)
    var category = CategoryData(context: AppDelegate().persistentContainer.viewContext)
    
    var helper = FileManagerHelper()
    var optionsArray = [OptionsData]()
    var questionArray = [Questions]()
    var userArray = [UserModel]()
    var categoryArray = [QuizCategory]()
    let username = UserDefaults.standard.string(forKey: "username")

    var selectedCategory: String?
    var points: Int16 = 0
    var percent: Double = 0
    var answeredQuestionsNum = 0

    func getData() {
        category.fetch { category in
            self.answeredQuestionsNum = Int(category.filter { $0.category == self.selectedCategory && $0.user == UserDefaults.standard.string(forKey: "username")}.first?.lastQuestion ?? 0)
            self.categoryArray = category.filter { $0.user == UserDefaults.standard.string(forKey: "username")}
        }
        
        questions.fetching { question in
            questionArray = question.filter { $0.category == selectedCategory}
            questionArray.sort { $0.id < $1.id }
        }
        
        options.fetch { options in
            optionsArray = options.filter { $0.category == selectedCategory}
        }
        
        helper.readData(completion: { user in
            userArray = user.filter({$0.username == self.username})
        })
    }
    
    func countPoints() {
        points = questionArray[answeredQuestionsNum].poitns
    }
    
    func calculate() -> Double {
        percent = Double(answeredQuestionsNum) / Double(questionArray.count)
        return percent
    }
  
}

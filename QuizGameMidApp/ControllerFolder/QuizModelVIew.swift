//
//  QuizModelVIew.swift
//  QuizGameMidApp
//
//  Created by Elsever on 02.01.25.
//

import Foundation
class QuizModelVIew {
    
    var questions = QuestionDataClass(context: AppDelegate().persistentContainer.viewContext)
    var options = OptionsDataClass(context: AppDelegate().persistentContainer.viewContext)
    var optionsArray = [OptionsData]()
    var questionArray = [Questions]()
    var count = 0
    var timer: Timer = Timer()
    
   
}

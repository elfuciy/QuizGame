//
//  QuestionData.swift
//  QuizGameMidApp
//
//  Created by Elsever on 01.01.25.
//

import Foundation
import CoreData

class QuestionDataClass {
    var context = AppDelegate().persistentContainer.viewContext
    var items = [Questions]()
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func saving(question: QuestionsModel) {
        let data = Questions(context: context)
        data.question = question.question
        data.answer = question.answer
        data.poitns = question.points ?? 0
        data.category = question.category
        data.id = question.id ?? 0
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func fetching(completion: (([Questions]) -> Void)) {
        do {
            items = try context.fetch(Questions.fetchRequest())
            completion(items)
        } catch {
            print(error.localizedDescription)
        }
    }
}

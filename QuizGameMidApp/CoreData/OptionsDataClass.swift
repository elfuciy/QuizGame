//
//  OptionsData.swift
//  QuizGameMidApp
//
//  Created by Elsever on 01.01.25.
//

import Foundation
import CoreData

class OptionsDataClass {
    var context = AppDelegate().persistentContainer.viewContext
    var items = [OptionsData]()
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func saving(options: OptionsModel) {
        let data = OptionsData(context: context)
        data.options = options.option
        data.option2 = options.option2
        data.option3 = options.option3
        data.category = options.category
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func fetch(completion: (([OptionsData]) -> Void)) {
        do {
            items = try context.fetch(OptionsData.fetchRequest())
            completion(items)
        } catch {
            print(error.localizedDescription)
        }
    }
}

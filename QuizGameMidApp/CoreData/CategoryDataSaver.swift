//
//  File.swift
//  QuizGameMidApp
//
//  Created by Elsever on 31.12.24.
//

import Foundation
import CoreData

class CategoryData {
    var context = AppDelegate().persistentContainer.viewContext
    var items = [QuizCategory]()
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func saving(category: CategoryModel) {
        let data = QuizCategory(context: context)
        data.category = category.category
        data.categoryColor = category.categoryColor
        data.categoryImage = category.categoryimage
        data.percent = category.percent ?? 0
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func fetch(completion: (([QuizCategory]) -> Void)) {
        do {
            items = try context.fetch(QuizCategory.fetchRequest())
            completion(items)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func updateCategoryPercent(percent: Double, filterText: String) {
        do {
            items = try context.fetch(QuizCategory.fetchRequest())
            let item = items.filter { $0.category == filterText }.first
            item?.percent = percent
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}

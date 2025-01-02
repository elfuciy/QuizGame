//
//  CategoryDataSave.swift
//  QuizGameMidApp
//
//  Created by Elsever on 31.12.24.
//

import Foundation
import CoreData
class DataSaver {
    let categories = CategoryData(context: AppDelegate().persistentContainer.viewContext)
    
    func dataSave() {
        let category = CategoryModel(category: "Sport Quiz", categoryColor: "Purple", categoryimage: "sportQuiz")
        let category2 = CategoryModel(category: "Music Quiz", categoryColor: "Blue", categoryimage: "musicQuiz")
        let category3 = CategoryModel(category: "Science Quiz", categoryColor: "Red", categoryimage: "scienceQuiz")
        let category4 = CategoryModel(category: "Game Quiz", categoryColor: "Green", categoryimage: "gameQuiz")
        let category5 = CategoryModel(category: "Countries Quiz", categoryColor: "Yellow", categoryimage: "countriesQuiz")
        
        categories.saving(category: category)
        categories.saving(category: category2)
        categories.saving(category: category3)
    }
}

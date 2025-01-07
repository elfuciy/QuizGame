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
    let questions = QuestionDataClass(context: AppDelegate().persistentContainer.viewContext)
    let options = OptionsDataClass(context: AppDelegate().persistentContainer.viewContext)
    var helper = FileManagerHelper()
    var userArray = [UserModel]()
    var categoryArray = [QuizCategory]()
    
    func dataSave(name: String) {
        helper.readData { data in
            userArray = data
        }
        let category = CategoryModel(category: "Sport Quiz", categoryColor: "Sport Purple", categoryimage: "sportQuiz", percent: 0, user: name, countNum: 0)
        let category2 = CategoryModel(category: "Music Quiz", categoryColor: "Music Yellow", categoryimage: "musicQuiz", percent: 0, user: name, countNum: 0)
        let category3 = CategoryModel(category: "Science Quiz", categoryColor: "Scince Blue", categoryimage: "scienceQuiz", percent: 0, user: name, countNum: 0)
        let category4 = CategoryModel(category: "Game Quiz", categoryColor: "Game Green", categoryimage: "gameQuiz", percent: 0, user: name, countNum: 0)
        let category5 = CategoryModel(category: "Countries Quiz", categoryColor: "Country Red", categoryimage: "countriesQuiz", percent: 0, user: name, countNum: 0)
        
        categories.saving(category: category)
        categories.saving(category: category2)
        categories.saving(category: category3)
        categories.saving(category: category4)
        categories.saving(category: category5)
        
        categories.fetch(completion: { data in
            categoryArray = data
        })
    
    
    }
    
    func questionsSave() {
        UserDefaults.standard.set(true, forKey: "isSaved")
        let option1 = OptionsModel(option: "A. England", option2: "B. France", option3: "C. Russia", category: "Countries Quiz")
        options.saving(options: option1)
        let question1 = QuestionsModel(answer: "A. England", points: 5, question: "Which country is the largest country in the world?",  category: "Countries Quiz", id: 1)
        questions.saving(question: question1)

        let option2 = OptionsModel(option: "A. USA", option2: "B. China", option3: "C. Brazil", category: "Countries Quiz")
        options.saving(options: option2)
        let question2 = QuestionsModel(answer: "B. China",points: 5, question: "Which country has the highest population?", category: "Countries Quiz", id: 2)
        questions.saving(question: question2)


        let option3 = OptionsModel(option: "A. Africa", option2: "B. Asia", option3: "C. Europe", category: "Countries Quiz")
        options.saving(options: option3)
        let question3 = QuestionsModel(answer: "B. Asia", points: 5, question: "Which continent is the largest by land area?", category: "Countries Quiz", id: 3)
        questions.saving(question: question3)


        let option4 = OptionsModel(option: "A. Amazon", option2: "B. Nile", option3: "C. Yangtze", category: "Countries Quiz")
        options.saving(options: option4)
        let question4 = QuestionsModel(answer: "B. Nile", points: 5, question: "What is the longest river in the world?", category: "Countries Quiz", id: 4)
        questions.saving(question: question4)

        let option5 = OptionsModel(option: "A. Indian", option2: "B. Atlantic", option3: "C. Pacific", category: "Countries Quiz")
        options.saving(options: option5)
        let question5 = QuestionsModel(answer: "C. Pacific", points: 5, question: "Which ocean is the largest?", category: "Countries Quiz", id: 5)
        questions.saving(question: question5)

        let option6 = OptionsModel(option: "A. Mount Everest", option2: "B. Kangchenjunga", option3: "C.  Mount Everest", category: "Countries Quiz")
        options.saving(options: option6)
        let question6 = QuestionsModel(answer: "C. Mount Everest", points: 10, question: "What is the highest mountain in the world?", category: "Countries Quiz", id: 6)
        questions.saving(question: question6)

        let option7 = OptionsModel(option: "A. Mercury", option2: "B. Venus", option3: "C. Mars", category: "Countries Quiz")
        options.saving(options: option7)
        let question7 = QuestionsModel(answer: "A. Mercury", points: 10, question: "Which planet is closest to the Sun?", category: "Countries Quiz", id: 7)
        questions.saving(question: question7)

        let option8 = OptionsModel(option: "A. Oxygen", option2: "B. Hydrogen", option3: "C. Carbon", category: "Countries Quiz")
        options.saving(options: option8)
        let question8 = QuestionsModel(answer: "B. Hydrogen", points: 10, question: "What is the most abundant element in the universe?", category: "Countries Quiz", id: 8)
        questions.saving(question: question8)

        let option9 = OptionsModel(option: "A. Saturn", option2: "B. Jupiter", option3: "C. Neptune", category: "Countries Quiz")
        options.saving(options: option9)
        let question9 = QuestionsModel(answer: "B. Jupiter", points: 10, question: "Which planet is the largest in our solar system?", category: "Countries Quiz", id: 9)
        questions.saving(question: question9)

        let option10 = OptionsModel(option: "A. Cheetah", option2: "B. Falcon", option3: "C. Sailfish", category: "Countries Quiz")
        options.saving(options: option10)
        let question10 = QuestionsModel(answer: "A. Cheetah", points: 10, question: "What is the fastest land animal?", category: "Countries Quiz", id: 10)
        questions.saving(question: question10)

        let option11 = OptionsModel(option: "A. Australia", option2: "B. Antarctica", option3: "C. Asia", category: "Countries Quiz")
        options.saving(options: option11)
        let question11 = QuestionsModel(answer: "B. Antarctica", points: 10, question: "Which continent is the coldest?", category: "Countries Quiz", id: 11)
        questions.saving(question: question11)

        let option12 = OptionsModel(option: "A. Leonardo da Vinci", option2: "B. Pablo Picasso", option3: "C. Vincent van Gogh", category: "Countries Quiz")
        options.saving(options: option12)
        let question12 = QuestionsModel(answer: "A. Leonardo da Vinci", points: 10, question: "Who painted the Mona Lisa?", category: "Countries Quiz", id: 12)
        questions.saving(question: question12)

        let option13 = OptionsModel(option: "A. Rome", option2: "B. London", option3: "C. Paris", category: "Countries Quiz")
        options.saving(options: option13)
        let question13 = QuestionsModel(answer: "C. Paris", points: 10, question: "What is the capital of France?", category: "Countries Quiz", id: 13)
        questions.saving(question: question13)

        let option14 = OptionsModel(option: "A. 5", option2: "B. 7", option3: "C. 9", category: "Countries Quiz")
        options.saving(options: option14)
        let question14 = QuestionsModel(answer: "B. 7", points: 10, question: "How many continents are there in the world?", category: "Countries Quiz", id: 14)
        questions.saving(question: question14)

        let option15 = OptionsModel(option: "A. Australia", option2: "B. New Zealand", option3: "C. Canada", category: "Countries Quiz")
        options.saving(options: option15)
        let question15 = QuestionsModel(answer: "A. Australia", points: 10, question: "Which country is known as the Land Down Under?", category: "Countries Quiz", id: 15)
        questions.saving(question: question15)

        let option16 = OptionsModel(option: "A. Oxygen", option2: "B. Water", option3: "C. Carbon Dioxide", category: "Countries Quiz")
        options.saving(options: option16)
        let question16 = QuestionsModel(answer: "B. Water", points: 15, question: "What is H2O commonly known as?", category: "Countries Quiz", id: 16)
        questions.saving(question: question16)

        let option17 = OptionsModel(option: "A. Africa", option2: "B. South America", option3: "C. Europe", category: "Countries Quiz")
        options.saving(options: option17)
        let question17 = QuestionsModel(answer: "A. Africa", points: 15, question: "Which continent is known as the birthplace of humanity?", category: "Countries Quiz", id: 17)
        questions.saving(question: question17)

        let option18 = OptionsModel(option: "A. Australia", option2: "B. Japan", option3: "C. Brazil", category: "Countries Quiz")
        options.saving(options: option18)
        let question18 = QuestionsModel(answer: "A. Australia", points: 15, question: "In which country does bird kiwi lives", category: "Countries Quiz", id: 18)
        questions.saving(question: question18)

        let option19 = OptionsModel(option: "A. 196", option2: "B. 195", option3: "C. 203", category: "Countries Quiz")
        options.saving(options: option19)
        let question19 = QuestionsModel(answer: "A. 196", points: 15, question: "How many countries in the world", category: "Countries Quiz", id: 19)
        questions.saving(question: question19)

        let option20 = OptionsModel(option: "A. Atlantic", option2: "B. Pacific", option3: "C. Indian", category: "Countries Quiz")
        options.saving(options: option20)
        let question20 = QuestionsModel(answer: "B. Pacific", points: 15, question: "Which ocean is the deepest?", category: "Countries Quiz", id: 20)
        questions.saving(question: question20)

    }
}

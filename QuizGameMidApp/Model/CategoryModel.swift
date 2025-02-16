//
//  CategoryModel.swift
//  QuizGameMidApp
//
//  Created by Elsever on 31.12.24.
//

import Foundation

struct CategoryModel {
    let category: String?
    let categoryColor: String?
    let categoryimage: String?
    let percent: Double?
    let user: String?
    let countNum: Int16?
    let miniImage: String?
}
struct QuestionsModel {
    let answer: String?
    let points: Int16?
    let question: String?
    let category: String?
    let id: Int16?
}

struct OptionsModel {
    let option: String?
    let option2: String?
    let option3: String?
    let category: String?
}

struct UserModel: Codable {
    let username: String?
    var point: Int?
}

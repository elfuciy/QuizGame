//
//  MainContollerModelView.swift
//  QuizGameMidApp
//
//  Created by Elsever on 10.01.25.
//

import Foundation

class MainContollerModelView {
    
    enum HomeSection {
        case category
        case sectionTitle
        case items
        case headSection
    }
    
    let sections: [HomeSection] = [.headSection, .category, .sectionTitle, .items]

    
//    func nuberOfRows(section: Int) -> Int{
//        switch sections[section] {
//        case .headSection:
//            return 1
//        case .category:
//            return categoryArray.count
//        case .sectionTitle:
//            return 1
//        case .items:
//            return categoryArray.count
//        }
//    }
}

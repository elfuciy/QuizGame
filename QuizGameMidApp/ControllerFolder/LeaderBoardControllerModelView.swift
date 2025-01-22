//
//  LeaderBoardControllerModelView.swift
//  QuizGameMidApp
//
//  Created by Elsever on 22.01.25.
//

import Foundation
import UIKit
class LeaderBoardModelView {
    
    enum BoardSections {
        case headTitle
        case board
    }
    
    let sections: [BoardSections] = [.headTitle, .board]
    
    var helper = FileManagerHelper()
    var userArray = [UserModel]()
    
    func layout(section: Int) -> NSCollectionLayoutSection  {
        switch sections[section] {
        case .headTitle:
            CompositionalLayout.createTitleSection(width: .fractionalWidth(1), height: .absolute(70))
        case .board:
            CompositionalLayout.createItemSection()
        }
    }
    
    func sectionItemsCount(section: Int) -> Int {
        switch sections[section] {
        case .headTitle:
            return 1
        case .board:
            return userArray.count
        }
    }
    
    func readData() {
        helper.readData { user in
            userArray = user
            userArray.sort(by: { $0.point ?? 0 > $1.point ?? 0 })
        }
    }
}

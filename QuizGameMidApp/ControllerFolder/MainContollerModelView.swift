//
//  MainContollerModelView.swift
//  QuizGameMidApp
//
//  Created by Elsever on 10.01.25.
//

import Foundation
import UIKit

class MainContollerModelView {
    
    enum HomeSection {
    case category
    case sectionTitle
    case items
    case headSection
}

let category = CategoryData(context: AppDelegate().persistentContainer.viewContext)
var categoryArray = [QuizCategory]()
var categoryItemArray = [QuizCategory]()
var user = [UserModel]()
let sections: [HomeSection] = [.headSection, .category, .sectionTitle, .items]
let username = UserDefaults.standard.string(forKey: "username")
    
    func logoutFunc() {
        UserDefaults.standard.removeObject(forKey: "username")
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
        guard let sceneDelegate = windowScene.delegate as? SceneDelegate else { return }
        sceneDelegate.login()
    }
    
    func getData() {
        FileManagerHelper().readData(completion: { result in
            user = result.filter({$0.username == username})
        })
        
        category.fetch { result in
            self.categoryArray.removeAll()
            self.categoryArray = result.filter { $0.user == self.username }
            self.categoryItemArray = result.filter { $0.percent != 0 && $0.user == self.username }
            self.categoryItemArray.sort {$0.percent > $1.percent}
            self.categoryArray.sort {$0.percent > $1.percent}
        }
    }
    
    func itemCount(section: Int) -> Int {
        switch sections[section] {
        case .headSection, .sectionTitle:
            return 1
        case .category:
            return categoryArray.count
        case .items:
            return categoryItemArray.count
        }
    }
    
    func layout(section: Int) -> NSCollectionLayoutSection  {
        switch sections[section] {
        case .headSection:
            CompositionalLayout.createTitleSection(width: .fractionalWidth(1), height: .absolute(70))
        case .category:
            CompositionalLayout.createCategorySection()
        case  .items:
            CompositionalLayout.createItemSection()
        case .sectionTitle:
            CompositionalLayout.createTitleSection(width: .absolute(335), height: .absolute(35))
        }
    }
}

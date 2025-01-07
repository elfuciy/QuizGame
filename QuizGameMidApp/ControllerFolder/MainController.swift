//
//  MainController.swift
//  QuizGameMidApp
//
//  Created by Elsever on 30.12.24.
//

import UIKit

class MainController: UIViewController {

    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var coinImage: UIImageView!
    
    let category = CategoryData(context: AppDelegate().persistentContainer.viewContext)
    var categoryArray = [QuizCategory]()
    enum HomeSection {
        case category
        case sectionTitle
        case items
        case headSection
    }
    
    let sections: [HomeSection] = [.headSection, .category, .sectionTitle, .items]
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.delegate = self
        collection.dataSource = self
        collection.register(UINib(nibName: "CategoryCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCell")
        collection.register(UINib(nibName: "GamesCells", bundle: nil), forCellWithReuseIdentifier: "GamesCells")
        collection.register(UINib(nibName: "TitleCell", bundle: nil), forCellWithReuseIdentifier: "TitleCell")

        collection.collectionViewLayout = createLayout()
       
        bar()
        getData()

        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(logout))
    }
    
    @objc func logout() {
        UserDefaults.standard.removeObject(forKey: "username")
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
        guard let sceneDelegate = windowScene.delegate as? SceneDelegate else { return }
        sceneDelegate.login()
    }
    
    func bar() {
        coinImage.image = UIImage(named: "coin3")
        coinImage.layer.masksToBounds = true
    }
    func createLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { sectionIndex, layoutEnviroment in
            switch self.sections[sectionIndex] {
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
    
    func getData() {
        category.fetch { result in
            categoryArray = result.filter { $0.user == UserDefaults.standard.string(forKey: "username")}
        }
    }
}

extension MainController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch sections[section] {
        case .headSection:
            return 1
        case .category:
            return categoryArray.count
        case .sectionTitle:
            return 1
        case .items:
            return categoryArray.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch sections[indexPath.section] {
        case .headSection:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TitleCell", for: indexPath) as! TitleCell
            cell.getText(text: "What would you like to play \n today?", size: 25)
            return cell
        case .category:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
            cell.configure(category: categoryArray[indexPath.row])
            return cell
        case .sectionTitle:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TitleCell", for: indexPath) as! TitleCell
            return cell
        case .items:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GamesCells", for: indexPath) as! GamesCells
            cell.configure(category: categoryArray[indexPath.row])
            return cell
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if sections[indexPath.section] == .items {
            let controller = storyboard?.instantiateViewController(withIdentifier: "QuizController") as! QuizController
            controller.callBack = {
                self.getData()
            }
            controller.selectedCategory = categoryArray[indexPath.row].category
            controller.hidesBottomBarWhenPushed = true
            navigationController?.show(controller, sender: nil)
        }
    }
}


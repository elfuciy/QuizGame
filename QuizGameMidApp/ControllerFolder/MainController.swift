//
//  MainController.swift
//  QuizGameMidApp
//
//  Created by Elsever on 30.12.24.
//

import UIKit

class MainController: UIViewController {
    @IBOutlet private weak var collection: UICollectionView!
    @IBOutlet private weak var coinImage: UIImageView!
    @IBOutlet private weak var pointsLabel: UILabel!
    
    let username = UserDefaults.standard.string(forKey: "username")
    
    enum HomeSection {
        case category
        case sectionTitle
        case items
        case headSection
    }
        
    let category = CategoryData(context: AppDelegate().persistentContainer.viewContext)
    var categoryArray = [QuizCategory]()
    var user = [UserModel]()
    let sections: [HomeSection] = [.headSection, .category, .sectionTitle, .items]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData()
        configureUI()
    }
    
    @objc func logout() {
        UserDefaults.standard.removeObject(forKey: "username")
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
        guard let sceneDelegate = windowScene.delegate as? SceneDelegate else { return }
        sceneDelegate.login()
    }
    
    func getData() {
        FileManagerHelper().readData(completion: { result in
            user = result.filter( { $0.username == username })
        })
        
        category.fetch { result in
            categoryArray.removeAll()
            categoryArray = result.filter { $0.user == username }
            categoryArray.sort {$0.percent > $1.percent}
            print(categoryArray.filter { $0.user == username })
            collection.reloadData()
        }
    }
    
    func configureUI() {
        collection.delegate = self
        collection.dataSource = self
        collection.register(UINib(nibName: "CategoryCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCell")
        collection.register(UINib(nibName: "GamesCells", bundle: nil), forCellWithReuseIdentifier: "GamesCells")
        collection.register(UINib(nibName: "TitleCell", bundle: nil), forCellWithReuseIdentifier: "TitleCell")
        collection.collectionViewLayout = createLayout()
        
        bar()
    }
    
    func bar() {
        coinImage.image = UIImage(named: "coin3")
        coinImage.layer.masksToBounds = true
        pointsLabel.text = "\(user[0].point ?? 0)"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(logout))
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
}

extension MainController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch sections[section] {
        case .headSection, .sectionTitle:
            return 1
        case .category, .items:
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
            cell.layer.cornerRadius = 12
            cell.layer.borderWidth = 1
            cell.layer.borderColor = UIColor.systemGray6.cgColor
            return cell
        case .sectionTitle:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TitleCell", for: indexPath) as! TitleCell
            return cell
        case .items:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GamesCells", for: indexPath) as! GamesCells
            cell.configure(category: categoryArray[indexPath.row])
            cell.layer.cornerRadius = 12
            cell.layer.borderWidth = 1
            cell.layer.borderColor = UIColor.systemGray6.cgColor
            return cell
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if sections[indexPath.section] == .items {
            let controller = storyboard?.instantiateViewController(withIdentifier: "QuizController") as! QuizController
            controller.callBack = { category in
                self.categoryArray = category
                self.navigationItem.rightBarButtonItem?.customView?.reloadInputViews()
                collectionView.reloadData()
            }
            controller.selectedCategory = categoryArray[indexPath.row].category
            controller.hidesBottomBarWhenPushed = true
            navigationController?.show(controller, sender: nil)
        }
    }
}

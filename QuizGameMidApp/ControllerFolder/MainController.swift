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
    let modelView = MainContollerModelView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        modelView.getData()
        configureUI()
//        configureCategoryArray()
    }
    
    func configureCategoryArray() {
        let controller = storyboard?.instantiateViewController(withIdentifier: "QuizController") as! QuizController
        controller.callBack = { category, user in
            print(category)
//            self.modelView.getData()
            self.modelView.categoryArray = category
            self.modelView.categoryArray.sort {$0.percent > $1.percent}
            self.modelView.categoryItemArray = self.modelView.categoryArray.filter({$0.percent > 0})
            self.modelView.categoryItemArray.sort {$0.percent > $1.percent}
            self.pointsLabel.text = "\(user[0].point ?? 0)"
            self.collection.reloadData()
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
        pointsLabel.text = "\(modelView.user[0].point ?? 0)"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(logout))
    }
    
    func createLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { sectionIndex, layoutEnviroment in
            self.modelView.layout(section: sectionIndex)
        }
    }
    
    @objc func logout() {
        modelView.logoutFunc()
    }
}

extension MainController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        modelView.itemCount(section: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch modelView.sections[indexPath.section] {
        case .headSection:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TitleCell", for: indexPath) as! TitleCell
            cell.getText(text: "What would you like to play \n today?", size: 25)
            return cell
            
        case .category:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
            cell.configure(category: modelView.categoryArray[indexPath.row])
            return cell
            
        case .sectionTitle:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TitleCell", for: indexPath) as! TitleCell
            if modelView.categoryItemArray.isEmpty {
                cell.getText(text: "You haven't started playing yet", size: 20)
            } else {
                cell.getText(text: "Unfinished Games", size: 20)
            }
            return cell
            
        case .items:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GamesCells", for: indexPath) as! GamesCells
                cell.configure(category: modelView.categoryItemArray[indexPath.row])
            return cell
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        modelView.sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if modelView.sections[indexPath.section] == .category || modelView.sections[indexPath.section] == .items {
            let controller = storyboard?.instantiateViewController(withIdentifier: "QuizController") as! QuizController
            controller.callBack = { category, user in
                self.modelView.categoryArray = category
                self.modelView.categoryArray.sort {$0.percent > $1.percent}
                self.modelView.categoryItemArray = self.modelView.categoryArray.filter({$0.percent > 0})
                self.modelView.categoryItemArray.sort {$0.percent > $1.percent}
                self.pointsLabel.text = "\(user[0].point ?? 0)"
                collectionView.reloadData()
            }

            controller.modelView.selectedCategory = modelView.categoryArray[indexPath.row].category ?? ""
            controller.hidesBottomBarWhenPushed = true
            navigationController?.show(controller, sender: nil)
        }
    }
}

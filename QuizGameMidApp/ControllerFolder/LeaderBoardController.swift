//
//  LeaderBoardController.swift
//  QuizGameMidApp
//
//  Created by Elsever on 11.01.25.
//

import UIKit

class LeaderBoardController: UIViewController {

    @IBOutlet weak var collection: UICollectionView!

    var modelView = LeaderBoardModelView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure() {
        collection.delegate = self
        collection.dataSource = self
        collection.register(UINib(nibName: "TitleCell", bundle: nil), forCellWithReuseIdentifier: "TitleCell")
        collection.register(UINib(nibName: "LeaderBoardCell2", bundle: nil), forCellWithReuseIdentifier: "LeaderBoardCell2")
        collection.collectionViewLayout = createLayout()
        readData()
       
    }
    
    func readData() {
        modelView.helper.readData { user in
            modelView.userArray = user
            modelView.userArray.sort(by: { $0.point ?? 0 > $1.point ?? 0 })
        }
    }
    
    func createLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { sectionIndex, layoutEnviroment in
            self.modelView.layout(section: sectionIndex)
        }
    }
}

extension LeaderBoardController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        modelView.sectionItemsCount(section: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch modelView.sections[indexPath.section] {
        case .headTitle:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TitleCell", for: indexPath) as! TitleCell
            cell.getText(text: "LeaderBoard", size: 25)
            return cell
        case .board:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LeaderBoardCell2", for: indexPath) as! LeaderBoardCell2
            cell.configure(user: modelView.userArray[indexPath.row], index: indexPath.row)
            return cell
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        modelView.sections.count
    }
    
   
    
}

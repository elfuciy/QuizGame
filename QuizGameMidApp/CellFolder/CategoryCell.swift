//
//  MainControllerCell.swift
//  QuizGameMidApp
//
//  Created by Elsever on 30.12.24.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryName: UILabel!
    @IBOutlet weak var question: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    
    func configure() {
        categoryImage.image = UIImage(named: "sportQuiz")
    }
    
}

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
    
    var color = ""
    override func awakeFromNib() {
        super.awakeFromNib()
        
        categoryImage.contentMode = .scaleAspectFill
    }
    
    func configure(category: QuizCategory) {
        categoryImage.image = UIImage(named: category.categoryImage ?? "")
        categoryName.text = category.category
        color = category.categoryColor ?? ""
    }
    
    
    
}

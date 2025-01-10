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
    @IBOutlet weak var cellView: UIView!
    
    var color = ""
    override func awakeFromNib() {
        super.awakeFromNib()
        categoryImage.contentMode = .scaleAspectFill
    }
    
    func configure(category: QuizCategory) {
        categoryImage.image = UIImage(named: category.categoryImage ?? "")
        categoryName.text = category.category
        color = category.categoryColor ?? ""
        ColorConfigurations().line(view: cellView, percent: category.percent, color: category.categoryColor ?? "")

    }
    
    
    
}

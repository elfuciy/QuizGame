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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    
    func configure() {
        categoryImage.contentMode = .scaleAspectFill
        layer.cornerRadius = 12
        layer.borderWidth = 1
        layer.borderColor = UIColor.systemGray6.cgColor
    }
    
    func configure(category: QuizCategory) {
        categoryImage.image = UIImage(named: category.categoryImage ?? "")
        categoryName.text = category.category
        ColorConfigurations().line(view: cellView, percent: category.percent, color: category.categoryColor ?? "")
    }
}

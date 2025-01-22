//
//  GamesCells.swift
//  QuizGameMidApp
//
//  Created by Elsever on 30.12.24.
//

import UIKit

class GamesCells: UICollectionViewCell {

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var categoryName: UILabel!
    @IBOutlet weak var questionNum: UILabel!
    @IBOutlet weak var percent: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    
    func configure() {
        image.contentMode = .scaleAspectFill
        layer.cornerRadius = 12
        layer.borderWidth = 1
        layer.borderColor = UIColor.systemGray6.cgColor
    }

    func configure(category: QuizCategory) {
        percent.text = "\(Int(category.percent * 100))%"
        categoryName.text = category.category
        questionNum.text = "20 Questions"
        image.image = UIImage(named: category.miniImage ?? "")
        ColorConfigurations().circle(view: cellView, percent: category.percent * 2, color: category.categoryColor ?? "")
    }
}

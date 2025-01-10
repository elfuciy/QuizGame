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
        image.contentMode = .scaleAspectFill

    }

    func configure(category: QuizCategory) {
        percent.text = "\(Int(category.percent * 100))%"
        categoryName.text = category.category
        questionNum.text = "20 Questions"
        print(category.miniImage ?? "+++++++++++++")
        image.image = UIImage(named: category.miniImage ?? "")
        ColorConfigurations().circle(view: cellView, percent: category.percent * 2, color: category.categoryColor ?? "")
    }
}

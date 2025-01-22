//
//  LeaderBoardCell2.swift
//  QuizGameMidApp
//
//  Created by Elsever on 22.01.25.
//

import UIKit

class LeaderBoardCell2: UICollectionViewCell {

    @IBOutlet weak var medalImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var number: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func configure(user: UserModel, index: Int) {
        nameLabel.text = user.username
        switch index {
        case 0:
            medalImage.image = UIImage(named: "gold")
        case 1:
            medalImage.image = UIImage(named: "silver")
        case 2:
            medalImage.image = UIImage(named: "bronze")
        default:
            break
        }
        if index > 2 {
            medalImage.isHidden = true
            number.isHidden = false
            number.text = "\(index + 1)"
        }
        
        layer.cornerRadius = 12
        layer.borderWidth = 1
        layer.borderColor = UIColor.systemGray6.cgColor
    }
}

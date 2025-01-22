//
//  LeaderBoardCell.swift
//  QuizGameMidApp
//
//  Created by Elsever on 11.01.25.
//

import UIKit

class LeaderBoardCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var medalImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(user: UserModel, index: Int) {
        nameLabel.text = user.username
        switch index {
        case 0:
            medalImage.tintColor = .yellow
        case 1:
            medalImage.tintColor = .gray
        case 2:
            medalImage.tintColor = .brown
        default:
            break
        }
        if index > 2 {
            medalImage.isHidden = true
        }
    }
    
}

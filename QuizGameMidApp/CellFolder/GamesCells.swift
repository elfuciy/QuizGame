//
//  GamesCells.swift
//  QuizGameMidApp
//
//  Created by Elsever on 30.12.24.
//

import UIKit

class GamesCells: UICollectionViewCell {

    @IBOutlet weak var cellView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        ColorConfigurations().circle(view: cellView)
    }

}

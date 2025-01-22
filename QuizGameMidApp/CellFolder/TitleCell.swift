//
//  TitleCell.swift
//  QuizGameMidApp
//
//  Created by Elsever on 30.12.24.
//

import UIKit

class TitleCell: UICollectionViewCell {

    @IBOutlet weak var textField: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func getText(text: String, size: CGFloat) {
        textField.text = text
        textField.font = UIFont.init(name: "Arial Rounded MT Bold", size: size)
        
    }
}

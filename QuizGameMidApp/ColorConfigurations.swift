//
//  ColorConfigurations.swift
//  QuizGameMidApp
//
//  Created by Elsever on 30.12.24.
//

import Foundation
import UIKit

class ColorConfigurations {
    
    func backgroundColor(_ view: UIView) {

        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor(named: "topPurple")?.cgColor ?? "", UIColor(named: "bottomPurple")?.cgColor ?? ""]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = view.bounds
        
        view.layer.insertSublayer(gradientLayer, at:0)
    }
    
    func setImages(_ image: UIImageView, name: String) {
        image.image = UIImage(named: name)
    }
    
    func circle(view: UIView) {
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: 328, y: 32), radius: 20, startAngle: 0, endAngle: .pi * 0.4, clockwise: true)
        
        let chapterShapeLayer = CAShapeLayer()
        chapterShapeLayer.path = circlePath.cgPath
        chapterShapeLayer.fillColor = UIColor.clear.cgColor
        chapterShapeLayer.strokeColor = UIColor(named: "topPurple")?.cgColor
        chapterShapeLayer.lineWidth = 2
        view.layer.addSublayer(chapterShapeLayer)
    }
}

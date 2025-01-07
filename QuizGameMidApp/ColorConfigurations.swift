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
    
    func circle(view: UIView, percent: Double, color: String, label: UILabel) {
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: 327, y: 32), radius: 20, startAngle: 0, endAngle: .pi * percent, clockwise: true)
        let circlePathShade = UIBezierPath(arcCenter: CGPoint(x: 327, y: 32), radius: 20, startAngle: 0, endAngle: .pi * 2, clockwise: true)
        
        let chapterShapeLayerShade = CAShapeLayer()
        chapterShapeLayerShade.path = circlePathShade.cgPath
        chapterShapeLayerShade.fillColor = UIColor.clear.cgColor
        chapterShapeLayerShade.strokeColor = UIColor.systemGray5.cgColor
        chapterShapeLayerShade.lineWidth = 3
        view.layer.addSublayer(chapterShapeLayerShade)
        
        let chapterShapeLayer = CAShapeLayer()
        chapterShapeLayer.path = circlePath.cgPath
        chapterShapeLayer.fillColor = UIColor.clear.cgColor
        chapterShapeLayer.strokeColor = UIColor(named: color)?.cgColor
        chapterShapeLayer.lineWidth = 3
        view.layer.addSublayer(chapterShapeLayer)
        
       
    }
    
    func line(view: UIView) {
        let path = UIBezierPath(cgPath: UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: 100, height: 1), cornerRadius: 1).cgPath)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor.systemGray5.cgColor
        view.layer.addSublayer(shapeLayer)
        
    }
}

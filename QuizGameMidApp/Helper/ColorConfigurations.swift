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
    
    func circle(view: UIView, percent: Double, color: String) {
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
    
    func line(view: UIView, percent: Double, color: String) {
        let shadowPath = UIBezierPath(cgPath: UIBezierPath(roundedRect: CGRect(x: 90, y: 170, width: 85, height: 4), cornerRadius: 1).cgPath)
        let path = UIBezierPath(cgPath: UIBezierPath(roundedRect: CGRect(x: 90, y: 170, width: 85 * percent, height: 4), cornerRadius: 1).cgPath)
        
        let shapeShadowLayer = CAShapeLayer()
        shapeShadowLayer.path = shadowPath.cgPath
        shapeShadowLayer.fillColor = UIColor.systemGray6.cgColor
        view.layer.addSublayer(shapeShadowLayer)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor(named: color)?.cgColor
        view.layer.addSublayer(shapeLayer)

    }
    
    func circleSecond(view: UIView, percent: Double) {
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: 30, y: 22), radius: 20, startAngle: 0, endAngle: .pi * (-percent), clockwise: false)
        let circlePathShade = UIBezierPath(arcCenter: CGPoint(x: 30, y: 22), radius: 20, startAngle: 0, endAngle: .pi * 2, clockwise: true)
        
        let chapterShapeLayerShade = CAShapeLayer()
        chapterShapeLayerShade.path = circlePathShade.cgPath
        chapterShapeLayerShade.fillColor = UIColor.clear.cgColor
        chapterShapeLayerShade.strokeColor = UIColor(named: "lightPurple")?.cgColor
        chapterShapeLayerShade.lineWidth = 3
        view.layer.addSublayer(chapterShapeLayerShade)
        
        let chapterShapeLayer = CAShapeLayer()
        chapterShapeLayer.path = circlePath.cgPath
        chapterShapeLayer.fillColor = UIColor.clear.cgColor
        chapterShapeLayer.strokeColor = UIColor.white.cgColor
        chapterShapeLayer.lineWidth = 3
        view.layer.addSublayer(chapterShapeLayer)
    }
}

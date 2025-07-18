//
//  Animations.swift
//  ToDoList
//
//  Created by Aryan Menon on 15/07/25.
//
import Foundation
import UIKit

extension UIView {
    
    func scaleUpAnimation() {
        UIView.animate(withDuration: 0.35, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 5, options: [.curveEaseOut]) {
            self.transform = CGAffineTransform.identity
        }

    }
    
    func pulseAnimation() {
        let pulseAnimation = CABasicAnimation(keyPath: "transform.scale")
        pulseAnimation.duration = 0.2
        pulseAnimation.toValue = 0.9
        pulseAnimation.autoreverses = true
        layer.add(pulseAnimation, forKey: nil)
    }
    
    func shakeAnimation() {
        let shakeAnimation = CABasicAnimation(keyPath: "position")
        shakeAnimation.duration = 0.05
        shakeAnimation.repeatCount = 3
        shakeAnimation.autoreverses = true
        shakeAnimation.timingFunction = CAMediaTimingFunction(name:.easeIn)
        
        let fromPoint = CGPoint(x: center.x - 5, y: center.y)
        let toPoint = CGPoint(x: center.x + 5, y: center.y)
        shakeAnimation.fromValue = fromPoint
        shakeAnimation.toValue = toPoint
        layer.add(shakeAnimation, forKey: nil)
    }
}

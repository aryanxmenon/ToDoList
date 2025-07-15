//
//  Extension+UIColor.swift
//  ToDoList
//
//  Created by Aryan Menon on 14/07/25.
//

import Foundation
import UIKit

extension UIColor {

    static var workTheme: UIColor {
        return UIColor(named: "work")!
    }
    
    static var secondaryWork: UIColor {
        return UIColor(named: "work")!.withAlphaComponent(0.2)
    }
    
    static var exerciseTheme: UIColor {
        return UIColor(named: "exercise")!
    }
    
    static var secondaryExercise: UIColor {
        return UIColor(named: "exercise")!.withAlphaComponent(0.2)
    }
    
    static var studyTheme: UIColor {
        return UIColor(named: "study")!
    }
    
    static var secondaryStudy: UIColor {
        return UIColor(named: "study")!.withAlphaComponent(0.2)
    }
    
    static var secondaryLinkTheme: UIColor {
        return UIColor(named: "secondaryLink")!
    }
}

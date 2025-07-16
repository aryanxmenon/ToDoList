//
//  CategoryModel.swift
//  ToDoList
//
//  Created by Aryan Menon on 07/07/25.
//

import Foundation
import UIKit
import RealmSwift

enum Category : String, CaseIterable, PersistableEnum {
    case work = "Work", study = "Study", exercise = "Exercise"
    
    var color: UIColor {
        switch self {
        case .work:
            return UIColor.work
        case .exercise:
            return UIColor.exercise
        case .study:
            return UIColor.study
        }
    }
    
    var secondaryColor: UIColor {
        switch self {
        case .work:
            return UIColor.secondaryWork
        case .exercise:
            return UIColor.secondaryExercise
        case .study:
            return UIColor.secondaryStudy
        }
    }
    
}

//
//  TaskModel.swift
//  ToDoList
//
//  Created by Aryan Menon on 08/07/25.
//

import Foundation

struct Task {
    let id : String
    let category : Category
    let caption : String
    let createdDate : Date
    var isComplete : Bool
}

    //
//  RoundedButton.swift
//  ToDoList
//
//  Created by Aryan Menon on 14/07/25.
//

import UIKit

class RoundedButton: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = UIColor.link
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 5
    }
}

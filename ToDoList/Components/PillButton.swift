//
//  PillButton.swift
//  ToDoList
//
//  Created by Aryan Menon on 14/07/25.
//

import UIKit

class PillButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = UIColor.link
        
    }

    
    override func layoutSubviews() {
        super.layoutSubviews()
        print(frame.height)
        layer.cornerRadius = frame.height / 2
    }
}

//
//  ShadowButton.swift
//  ToDoList
//
//  Created by Aryan Menon on 14/07/25.
//

import UIKit


class ShadowButton: UIButton {

    @IBInspectable
    var cornerRadius: CGFloat = 5 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable
    var background: UIColor = .link {
        didSet {
            backgroundColor = background
        }
    }
    
    @IBInspectable
    var shadowColour: UIColor = .secondaryLink {
        didSet {
            layer.shadowColor = shadowColour.cgColor
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }
    
    private func setupView() {
        backgroundColor = background
        layer.shadowColor = shadowColour.cgColor
        layer.masksToBounds = false
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 0
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        layer.shadowOffset = CGSize(width: 0, height: 5)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = cornerRadius
        //layer.shadowColor = UIColor(named: "secondaryLink")?.cgColor
    }
    
}

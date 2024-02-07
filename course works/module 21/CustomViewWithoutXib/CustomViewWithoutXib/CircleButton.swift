//
//  CircleButton.swift
//  CustomViewWithoutXib
//
//  Created by Игорь Крысин on 17.01.2024.
//

import UIKit

@IBDesignable
class CircleButton: UIButton {
    
    @IBInspectable var roundButton: Bool = false {
        didSet {
            if roundButton {
                layer.cornerRadius = frame.height/2
            }
        }
    }
    
    
    
    
   
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

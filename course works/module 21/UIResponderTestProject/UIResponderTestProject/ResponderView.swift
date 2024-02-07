//
//  ResponderView.swift
//  UIResponderTestProject
//
//  Created by Игорь Крысин on 19.01.2024.
//

import Foundation
import UIKit

class ResponderView: UILabel {
    override var canBecomeFirstResponder: Bool {
        return true
    }
}

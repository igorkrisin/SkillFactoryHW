//
//  CustomView.swift
//  CustomCircleViewGesture
//
//  Created by Игорь Крысин on 21.01.2024.
//

import UIKit

@IBDesignable
class CustomView: UIView {
    
    var workingView: UIView!

    @IBOutlet var customView: UIView!
    
    
    @IBInspectable var colorSet: UIColor {
         get {
             return workingView.backgroundColor!
         }
         set {
             workingView.backgroundColor = newValue
         }
     }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setCustomView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setCustomView()
    }
    
    func getXib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let xib = UINib(nibName: "customViewXib", bundle: bundle)
        let view = xib.instantiate(withOwner: self, options: nil).first as! UIView
        
        return view
    }
    
    func setCustomView() {
        workingView = getXib()
        workingView.frame = bounds
        workingView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        //workingView.layer.cornerRadius = frame.height / 2
        
        addSubview(workingView)
    }
    
    @IBInspectable var roundButton: Bool = false {
        didSet {
            if roundButton {
                workingView.layer.cornerRadius = frame.height/2
            }
        }
    }
    
    override func prepareForInterfaceBuilder() {
        if roundButton {
            workingView.layer.cornerRadius = frame.height / 2
        }
    }
    

}

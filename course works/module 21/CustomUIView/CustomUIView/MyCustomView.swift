//
//  MyCustomView.swift
//  CustomUIView
//
//  Created by Игорь Крысин on 16.01.2024.
//

import UIKit

@IBDesignable class MyCustomView: UIView {

    @IBOutlet weak var customLabel: UILabel!
    
    var workingView: UIView!
    var xibName: String = "MyCustomView"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setCustomView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setCustomView()
    }
    
   @IBInspectable var labelText: String {
        get {
            return customLabel.text!
        }
        set(labelText) {
            customLabel.text = labelText
        }
    }
    
    func getFromXib() -> UIView {
        let bundel = Bundle(for: type(of: self))
        let xib = UINib(nibName: xibName, bundle: bundel)
        let view = xib.instantiate(withOwner: self, options: nil).first as! UIView
        
        return view
    }
    
    func setCustomView() {
        workingView = getFromXib()
        workingView.frame = bounds
        workingView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        workingView.layer.cornerRadius = frame.size.width/2
        addSubview(workingView)
    }

}

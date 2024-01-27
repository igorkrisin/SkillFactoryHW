//
//  ViewController.swift
//  CircleViewGesture
//
//  Created by Игорь Крысин on 20.01.2024.
//
import Foundation
import UIKit

class ViewController: UIViewController {
    
    var views: [UIView] = []
    //let myCustomView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawCircleView(countView: 7)
    }
    
    

    func drawCircleView(countView: Int){
       
        let subscribeWidth  = (0...Int(view.frame.width) - 100)
        let subscribHeight  = (0...Int(view.frame.height) - 100)
        var i: Int = 0
        while i < countView {
            let color = setDifferentCollor()
            let customView = UIView()
            let x = subscribeWidth.randomElement()!
            let y = subscribHeight.randomElement()!
            let width = 100
            let height = 100
            customView.frame = CGRect(x: x, y: y, width: width, height: height)
            print(views.count)
            if checkViewIntersection(viewCreate: customView, viewArray: views) {
                continue
            }
            customView.backgroundColor = color
            customView.layer.cornerRadius = CGFloat(height/2)
            view.addSubview(customView)
            self.views.append(customView)
                
            
            addGestureForView(customView: views[i])
            i += 1
        }
    }
    
    
    
    
    func addGestureForView(customView: UIView!){
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlerPanGesture))
        
        customView.addGestureRecognizer(panGestureRecognizer)
    }
    
    
    @objc func handlerPanGesture(_ recognizer: UIPanGestureRecognizer) {
        let movingView = recognizer.translation(in: self.view)
        guard let gestureView = recognizer.view else { return }
        //print(gestureView)
        self.view.bringSubviewToFront(gestureView)
        gestureView.center = CGPoint (
            x: gestureView.center.x + movingView.x,
            y: gestureView.center.y + movingView.y)
        
        recognizer.setTranslation(CGPoint.zero, in: self.view)
        if recognizer.state == .ended {
            UIView.animate(withDuration: 0.5) { [self] in
                addIntersectionView(recognizer, views: self.views)
            }
            //add intersecrion between view here
            
        }
      
    }
    
    
    func addIntersectionView(_ recognizer: UIPanGestureRecognizer, views: [UIView]) {
        guard let movingView = recognizer.view else { return }
        for otherView in views {
            if otherView != movingView && movingView.frame.intersects(otherView.frame){
                otherView.frame = CGRect(x: otherView.frame.minX, y: otherView.frame.minY, width: otherView.frame.width + 20, height: otherView.frame.height + 20)
                otherView.backgroundColor = setDifferentCollor()
                otherView.layer.cornerRadius =  CGFloat(otherView.frame.height/2)
                movingView.removeFromSuperview()
                deleteElementArray(view: movingView)
                movingView.removeGestureRecognizer(recognizer)
                view.setNeedsDisplay()
            }
        }
    }
    
    
    func checkViewIntersection(viewCreate: UIView, viewArray: [UIView]) -> Bool {
        for i in 0..<viewArray.count{
            if viewCreate.frame.intersects(viewArray[i].frame) {
                return true
            }
        }
        return false
    }
    
    func deleteElementArray(view: UIView) {
        for i in 0..<views.count {
            if view == views[i] {
                views.remove(at: i)
                break
            }
        }
    }
    
    func setDifferentCollor() -> UIColor {
        let color: UIColor = .randomColor()
        return color
    }
    
    
}

extension CGFloat {
    static func randomFloat() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func randomColor() -> UIColor {
        return UIColor(
           red:   .randomFloat(),
           green: .randomFloat(),
           blue:  .randomFloat(),
           alpha: 1.0
        )
    }
}

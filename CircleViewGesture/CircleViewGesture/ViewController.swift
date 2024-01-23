//
//  ViewController.swift
//  CircleViewGesture
//
//  Created by Игорь Крысин on 20.01.2024.
//

import UIKit

class ViewController: UIViewController {
    
    var views: [UIView] = []
    //let myCustomView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //createArrayViews(view: myCustomView, count: 7)
        //print(views)
        drawCircleView(countView: 7,  color: .red)
        //print("create")
    }
    
    
    func createArrayViews(view: UIView?, count: Int) {
        for _ in 0..<count {
            guard let myView = view else { return }
            views.append(myView)
        }
    }

    func drawCircleView(countView: Int, color: UIColor){
        let subscribeWidth  = (0...Int(view.frame.width) - 100)
        let subscribHeight  = (0...Int(view.frame.height) - 100)
        var i: Int = 0
        while i < countView {
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
        gestureView.center = CGPoint (
            x: gestureView.center.x + movingView.x,
            y: gestureView.center.y + movingView.y)
        
        recognizer.setTranslation(CGPoint.zero, in: self.view)
        
        //add intersecrion between view here
        addIntersectionView(recognizer, views: views)
      
    }
    
    
    func addIntersectionView(_ recognizer: UIPanGestureRecognizer, views: [UIView]) {
        guard let movingView = recognizer.view else { return }
        for otherView in views {
            if otherView != movingView && movingView.frame.intersects(otherView.frame){
                otherView.frame = CGRect(x: otherView.frame.minX, y: otherView.frame.minY, width: otherView.frame.width + 20, height: otherView.frame.height + 20)
                otherView.backgroundColor = .green
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
    
    
}


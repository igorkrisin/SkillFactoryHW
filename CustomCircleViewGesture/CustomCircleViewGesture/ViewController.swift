//
//  ViewController.swift
//  CustomCircleViewGesture
//
//  Created by Игорь Крысин on 21.01.2024.
//

import UIKit



class ViewController: UIViewController {
    
    @IBOutlet var customView: [CustomView]!
    
    var moreSize: CGFloat = 0.05 // coefficient transformation after intercection view
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    @IBAction func panAction(_ recognizer: UIPanGestureRecognizer) {
        let gestureTranslation = recognizer.translation(in: view)
        guard let gestureView = recognizer.view else { return }
        gestureView.center = CGPoint (x: gestureView.center.x + gestureTranslation.x, y: gestureView.center.y + gestureTranslation.y)
        
        recognizer.setTranslation(.zero, in: view)
        
        addIntersectionView(recognizer, views: customView)
        
        
    }
    
    
   
    
    
    func addIntersectionView(_ recognizer: UIPanGestureRecognizer, views: [UIView]) {
        guard let movingView = recognizer.view else { return }
        
        for otherView in views {
            //print("moving view: ", movingView)
            
           
            if otherView != movingView && movingView.frame.intersects(otherView.frame) {

                let indexView: Int = customView.firstIndex(of: otherView as! CustomView) ?? 0
                customView[indexView].transform = CGAffineTransform(scaleX: 1.3+moreSize, y: 1.3+moreSize)
                customView[indexView].colorSet = .green
                otherView.layer.cornerRadius =  CGFloat(otherView.frame.height/2)
                movingView.transform = CGAffineTransform(scaleX: 0.0001, y: 0.0001)
                deleteElementArray(view: movingView)
                movingView.removeGestureRecognizer(recognizer)
                view.setNeedsDisplay()
                moreSize += 0.05
            }
        }
    }
    
    
    func deleteElementArray(view: UIView) {
        for i in 0..<customView.count {
            if view == customView[i] {
                customView.remove(at: i)
                break
            }
        }
    }



}


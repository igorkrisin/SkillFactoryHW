//
//  ViewController.swift
//  CALayer
//
//  Created by Игорь Крысин on 26.01.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var someView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //ПРУЖИННЫЕ анимации
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let color: UIColor = UIColor(red: 0.250, green: 0.218, blue: 0.221, alpha: 1)
        someView.backgroundColor = color
        someView.layer.cornerRadius = 15
        someView.layer.shadowOffset = CGSize(width: 3, height: 4)
        someView.layer.shadowOpacity = 0.7
        someView.layer.shadowRadius = 5
        someView.layer.shadowColor = UIColor.gray.cgColor
        
        someView.layer.borderColor = UIColor.gray.cgColor
        someView.layer.borderWidth = 2
        
        UIView.animate(withDuration: 1, delay: 1, usingSpringWithDamping: 0.3, initialSpringVelocity: 5, options: .curveEaseInOut) {
            self.someView.center.x += 50
        }
    }
    
    
    /* //анимации calayer слоев
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let color: UIColor = UIColor(red: 0.250, green: 0.218, blue: 0.221, alpha: 1)
        someView.backgroundColor = color
        someView.layer.cornerRadius = 15
        someView.layer.shadowOffset = CGSize(width: 3, height: 4)
        someView.layer.shadowOpacity = 0.7
        someView.layer.shadowRadius = 5
        someView.layer.shadowColor = UIColor.gray.cgColor
        
        someView.layer.borderColor = UIColor.gray.cgColor
        someView.layer.borderWidth = 2
        
        
        someView.layer.borderColor = UIColor.gray.cgColor
        someView.layer.borderWidth = 2
        //перемемещение по экраку
//        let animation = CABasicAnimation(keyPath: "position")
//        //откуда аинмируем от какого объекта
//        animation.fromValue = view.center
//        
//        animation.toValue = CGPoint(x: 100.0, y: 100.0)
//        animation.duration = 3.0
//        animation.autoreverses = true
//        animation.repeatCount = 2
//        someView.layer.add(animation, forKey: "animatedPosition")
        //исчезновение
//        let animation = CABasicAnimation(keyPath: "opacity")
//        animation.fromValue = 1
//        animation.toValue = 0
//        animation.duration = 1
//        animation.autoreverses = true
//        someView.layer.add(animation, forKey: "changeOpacity")
        //изменение размеров анимация
        let animation = CABasicAnimation(keyPath: "transform.scale.x")
        print(someView.layer.frame.width)
        animation.fromValue = 1
        animation.toValue = 2
        animation.duration = 2
        animation.repeatCount = 3
        animation.autoreverses = true
        someView.layer.add(animation, forKey: "changeScaleX")
        
        
    }

*/
}
    


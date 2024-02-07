//
//  ViewController.swift
//  transformationUIView
//
//  Created by Игорь Крысин on 25.01.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var yellowView: UIView!
    
    @IBOutlet weak var labelOutlet: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.yellowView.transform = CGAffineTransform.identity
        
    }

    
    @IBAction func transformButton(_ sender: Any) {
        
        UIView.animate(withDuration: 1, animations: {
        //1 варинат трансформации
//            self.yellowView.transform.tx = -50
//            self.yellowView.transform.ty = -50
        //2 вариант тр-ии
//            self.yellowView.transform = self.yellowView.transform.translatedBy(x: -50, y: -50)
        //3 вариант тр-ии
            //self.yellowView.transform = CGAffineTransform(translationX: -50, y: -50)
        //изменение размеров View
//            self.yellowView.transform = CGAffineTransform(scaleX: 2, y: 2)
        //поворот view на 180 гр, значение 180 можно убрать из аргумента совсем тк pi = 180гр(3,14 радиан)
            //self.yellowView.transform = CGAffineTransform(rotationAngle: 180 * CGFloat.pi / 180)
        //поворот view на 180 гр
            //self.yellowView.transform = CGAffineTransform(rotationAngle: 21 * CGFloat.pi / 180)
        //поворот при помощи матрицы на 10 гр
//            let angle: CGFloat = 10 * CGFloat.pi / 180
//            self.yellowView.transform.a = cos(angle)
//            self.yellowView.transform.b = sin(angle)
//            self.yellowView.transform.c = -sin(angle)
//            self.yellowView.transform.d = cos(angle)
        //искажение матрицы
//            let angle: CGFloat = 45 * CGFloat.pi / 180
//            self.yellowView.transform.b = cos(angle)
        //совмещение транчформаций
            let angle: CGFloat = 45*CGFloat.pi/180
            //сначала поворачиваем
            let rotationMatrix = CGAffineTransform(rotationAngle: angle)
            //потом перемещаем
            let translationMAtrix = CGAffineTransform(translationX: 80, y: 0)
            // при помощи метода concatinatinating
            self.yellowView.transform = rotationMatrix.concatenating(translationMAtrix)
           
            
        })
        
       
        
    }
    
    @IBAction func resetButton(_ sender: Any) {
        UIView.animate(withDuration: 1, animations: {
            self.yellowView.transform = CGAffineTransform.identity
        })
        
    }
    
}


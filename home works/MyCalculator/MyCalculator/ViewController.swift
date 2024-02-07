//
//  ViewController.swift
//  MyCalculator
//
//  Created by Игорь Крысин on 20.12.2023.
//

import UIKit

class ViewController: UIViewController {

    
    let regex = #"^[^\d.]*$"#
    var firstNumber: String = "0"
    var secondNumber: String = ""
    var summaryNumber: String = ""
    var mathSing: String = ""
    
    var isOperationDuring = false
    
    var isDotPushed = false
    var calcTapped = false
    var mathSingTapped = false
    var isEqualTapped = false
    var isFirstTapped = false
    var minusValue: Bool = false
    
    
    @IBOutlet weak var resultLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isFirstTapped = false
        
    }
    
    
    
    @IBAction func mathOperation(_ sender: Any) { // кнопки математических операций
        if (sender as AnyObject).tag == 11 {
            mathSing = "/"
        } else if (sender as AnyObject).tag == 12 {
            mathSing = "*"
        } else if (sender as AnyObject).tag == 13 {
            mathSing = "-"
        } else if (sender as AnyObject).tag == 14 {
            mathSing = "+"
        }
        showCalculatorScreen(mathSing)
        mathSingTapped = true
        minusValue = false
    }
    
    
    @IBAction func minusOrPlus(_ sender: Any) { //плюс минус для числа на экране
       assignValueToNumber("+/-")
        if !minusValue && !isMathSing(resultLabel.text!) {
            resultLabel.text! = "-" + resultLabel.text!
            minusValue = true
        } else if minusValue && resultLabel.text!.contains("-") {
            resultLabel.text!.removeFirst()
            minusValue = false
        }
        
    }
    

    @IBAction func percent(_ sender: Any) { //проценты вычисляются внутри
        
        if mathSing == "+" || mathSing == "-" {
            secondNumber = String((Double(secondNumber)! * 0.01) * Double(firstNumber)!)
        } else if mathSing == "*" || mathSing == "/" {
            secondNumber = String(Double(secondNumber)! * 0.01)
        }
    }
    
    
    @IBAction func equal(_ sender: Any) { // равно
        
        isEqualTapped = true
        mathSingTapped = false
        calc()
    }
    
    
    @IBAction func digitButtonAction(_ sender: Any) { //все цифры
        showCalculatorScreen(String((sender as AnyObject).tag))
        assignValueToNumber(String((sender as AnyObject).tag))
    }
    
    
    @IBAction func dot(_ sender: Any) { // точка
        showCalculatorScreen(".")
        assignValueToNumber(".")
    }
    
    @IBAction func reset(_ sender: Any) { //(АС)
        secondNumber = ""
        firstNumber = ""
        mathSing = ""
        resultLabel.text! = "0"
        summaryNumber = ""
        
    }
    
    //выводит на экран содержимое
    func showCalculatorScreen(_ value: String) {
        
        if isMathSing(value) && value != "." && value != "%" {
            if !isOperationDuring {
                firstNumber = resultLabel.text!
            }
            resultLabel.text! = ""
            resultLabel.text! = value
        } else if !isFirstTapped && value == "." {
            resultLabel.text! = "0."
            isFirstTapped = true
        } else if isFirstTapped && value == "." && isMathSing(resultLabel.text!) {
            resultLabel.text! = "0."
            
        } else if (!isFirstTapped) { // первое нажатие удаляем первый 0
            resultLabel.text! = ""
            resultLabel.text! = value
            isFirstTapped = true
            isOperationDuring = true
            
        } else if isEqualTapped { // показывем результат при нажати на равно
            resultLabel.text! = ""
            resultLabel.text! = value
            isEqualTapped = false
            isOperationDuring = false // операция окончена
            isFirstTapped = false //первое нажатие в режиме ожидания
            resetValue()
        } else if value == "%" {
            calc()
        } else if value == "." && !resultLabel.text!.contains(".") && !isMathSing(resultLabel.text!) {
            resultLabel.text! += value
        } else {
            if isMathSing(resultLabel.text!) && secondNumber.count == 0 { //если после знака вводим число - знак надо удалить
                    resultLabel.text! = ""
            }
            resultLabel.text! += value
        }
    }
    
    //присваивает в переменные значения
    func assignValueToNumber(_ value: String) {
        if !mathSingTapped {
            if value == ("+/-") {
                firstNumber = "-" + firstNumber
            } else {
                firstNumber += value
            }
        } else if !isMathSing(resultLabel.text!) { // что бы при выведении знака на табло невозможно было поставить - перед знаком
            if value == ("+/-") {
                secondNumber = "-" + secondNumber
            } else {
                secondNumber += value
            }
        }
    }
    
    //проверяет наличие матемаитческого символа в строке
    
    func isMathSing (_ value: String) -> Bool {
        let regex = #"^[^\d]*$"#
        let isMatch = value.range(of: regex, options: .regularExpression) != nil
        return isMatch
    }
    
    //make math operation
    func calc(){
        if firstNumber != "" && secondNumber != ""  && !isMathSing(firstNumber) && !isMathSing(secondNumber) {
            
            switch mathSing {
            case "/":
                if secondNumber == "0" {
                    resultLabel.text! = "ERROR"
                    return
                }
                if hasDotInSring() { // если число с точкой конвертируем во float
                    summaryNumber = String((Float(firstNumber))! / (Float(secondNumber))!)
                } else { // если нет то в Int
                    summaryNumber = String((Int(firstNumber))! / (Int(secondNumber))!)
                }
                showCalculatorScreen(summaryNumber)
            case "*":
                if hasDotInSring() {
                    summaryNumber = String((Float(firstNumber))! * (Float(secondNumber))!)
                } else {
                    summaryNumber = String((Int(firstNumber))! * (Int(secondNumber))!)
                }
                showCalculatorScreen(summaryNumber)
            case "-":
                if hasDotInSring() {
                    summaryNumber = String((Float(firstNumber))! - (Float(secondNumber))!)
                } else {
                    summaryNumber = String((Int(firstNumber))! - (Int(secondNumber))!)
                }
                showCalculatorScreen(summaryNumber)
            case "+":
                if hasDotInSring() {
                    summaryNumber = String((Float(firstNumber))! + (Float(secondNumber))!)
                } else {
                    summaryNumber = String((Int(firstNumber))! + (Int(secondNumber))!)
                }
                showCalculatorScreen(summaryNumber)
            
                
            default:
                break
            }
        } else {
            resetValue()
        }
    }
    //пытался сжедать на дженериках калькуляцию - не запустилась
    func doMathOperations<T: FloatingPoint>(_ firstNumber: T, _  secondNumber: T, _ mathSing: String) -> T? {
        if mathSing ==  "-" { return firstNumber - secondNumber }
        else if mathSing ==  "*" { return firstNumber * secondNumber }
        else if mathSing ==  "+" { return firstNumber + secondNumber }
        guard secondNumber != 0 else {
            resultLabel.text! = "Err"
            return nil
        }
        return firstNumber / secondNumber
    }
    


    func hasDotInSring() -> Bool { //есть ли точка в числах?
        return firstNumber.contains(".") || secondNumber.contains(".")
            
    }
    
    func resetValue (){ // очитка полей (АС)
        secondNumber = ""
        firstNumber = ""
        mathSing = ""
    }
    
    
    

}


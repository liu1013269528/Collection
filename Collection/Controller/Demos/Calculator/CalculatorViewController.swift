//
//  CalculatorViewController.swift
//  Collection
//
//  Created by 刘伟 on 15/11/10.
//  Copyright © 2015年 lawrence_liu. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    //Outlet
    @IBOutlet weak var display: UILabel!
    //变量
    var userIsInTheMiddleOfTypingANumber = false
    var operandStack = Array<Double>()
    var preOperator:String?
    var onlyEqual:Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //数字的点击事件
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTypingANumber {
            if display.text == "0" {
                display.text = digit
            }else{
                display.text = display.text! + digit
            }
        } else {
            display.text = digit
            userIsInTheMiddleOfTypingANumber = true
        }
    }
    
    //等于结果
    @IBAction func equal() {
        if operandStack.count == 1 {
            operandStack.append(displayValue)
        }
        runOperation()
        
    }
    
    
    func runOperation(){
        userIsInTheMiddleOfTypingANumber = false
        if let currentOperator = preOperator {
            var result:Double? = nil
            switch currentOperator {
            case "+": result = Calculate.singleton.performOperation(operandStack){ $0 + $1}
            case "−": result = Calculate.singleton.performOperation(operandStack){ $1 - $0}
            case "×": result = Calculate.singleton.performOperation(operandStack){ $0 * $1}
            case "÷": result = Calculate.singleton.performOperation(operandStack){ $1 / $0}
            default: break
            }
            if let value = result {
                displayValue = value
                operandStack = Array<Double>()
                preOperator = ""
                onlyEqual = true
            }
        }
        print(operandStack)
    }
    
    
    @IBAction func operation(sender: UIButton) {
        operandStack.append(displayValue)
        onlyEqual = false
        runOperation()
        preOperator = sender.currentTitle!
    }
    
    @IBAction func clear(sender: UIButton) {
        display.text = "0"
        operandStack = Array<Double>()
    }
    
    
    //计算属性
    var displayValue: Double {
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set {
            let newString = "\(newValue)"
            var resultArray = newString.componentsSeparatedByString(".")
            print(resultArray)
            if resultArray.count > 2 {
                display.text = "0.00"
            } else {
                if resultArray[0].characters.count > 7 {
                    display.text = "0.00"
                } else {
                    let littleInt = NSNumberFormatter().numberFromString(resultArray[1])!.intValue
                    if littleInt > 100 {
                        
                    }
                    display.text = resultArray[0] + "." + resultArray[1]
                }
            }
            userIsInTheMiddleOfTypingANumber = false
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}


class Calculate {
    static let singleton = Calculate()
    
    //闭包
    func performOperation(var operandStack: Array<Double> , operation: (Double, Double) -> Double) -> Double? {
        var result:Double?
        if operandStack.count >= 2 {
            result = operation(operandStack.removeLast(), operandStack.removeLast())
        }else{
            result = nil
        }
        return result
    }
}

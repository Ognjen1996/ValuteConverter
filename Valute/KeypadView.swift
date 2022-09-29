//
//  KeypadView.swift
//  Valute
//
//  Created by Uros Andonov on 27.9.22..
//

import UIKit

final class KeypadView: UIView {

    var text: String?
    var ammonut: Double?
    @IBOutlet var digitButtons: [UIButton]!
    @IBOutlet var operatorButtons: [UIButton]!
    @IBOutlet var leftTextField: UITextField!
    @IBOutlet var rightTextField: UITextField!
    
    private var originalBackgroundColor: UIColor?
    
    private(set) var stringAmount: String?
    
    var number1: Double?
    var number2: Double?
    var sign: String?
    

    
    @IBAction func didTapButton(_ sender: UIButton) {
        if let caption = sender.titleLabel!.text {
//            var s = resultLabel.text ?? ""
//            s += caption
//            resultLabel.text = s
        }
    }
    
    @IBAction func didTouchButton(_ sender: UIButton){
        originalBackgroundColor = sender.backgroundColor
        
        guard let originalBackgroundColor = originalBackgroundColor else {
            sender.backgroundColor = UIColor.black.withAlphaComponent(0.2)
            return
        }
        
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0.2
        
        guard let _ = sender.backgroundColor?.getRed(&r, green: &g, blue: &b, alpha: &a) else {
            sender.backgroundColor = UIColor.black.withAlphaComponent(0.2)
            return
        }
        sender.backgroundColor = UIColor(red: r, green: g, blue: b, alpha: a*2)
    }
    @IBAction func buttonsUntouch(_ sender: UIButton) {
        sender.backgroundColor = originalBackgroundColor
        originalBackgroundColor = nil
    }
    
    @IBAction func addDigit(_ sender: UIButton) {
        guard let numString = sender.titleLabel?.text else {
            buttonsUntouch(sender)
            return
        }
        
        var value = stringAmount ?? ""
        value += numString
        stringAmount = value
    }
    
    @IBAction func didTapOperator(_ sender: UIButton){
        if let caption = sender.titleLabel!.text {
            sign = caption
            number1 = Double(leftTextField.text!)
//            clearAll()
    }
//        disableButtons()
}
    
    @IBAction func didTapEquals(_ sender: UIButton){
        switch sign{
        case "+":
            number2 = Double(leftTextField.text!)
            let result = number1! + number2!
            let a = String(result)
            stringAmount = a
//            applyTheme()
            break
        case "-":
            number2 = Double(leftTextField.text!)
            let result = number1! - number2!
            let a = String(result)
            stringAmount = a
//            applyTheme()
            break
        case "X":
            number2 = Double(leftTextField.text!)
            let result = number1! * number2!
            let a = String(result)
            stringAmount = a
//            applyTheme()
            break
        case "/":
            number2 = Double(leftTextField.text!)
            let result = number1! / number2!
            let a = String(result)
            stringAmount = a
//            applyTheme()
            break
        default:
            buttonsUntouch(sender)
//            applyTheme()
            break
            
        }
//        enableButtons()
    }
}
    


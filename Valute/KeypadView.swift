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
    
}

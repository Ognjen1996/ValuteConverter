//
//  CurrencyBox.swift
//  Valute
//
//  Created by Uros Andonov on 27.9.22..
//

import UIKit

final class CurrencyBox: UIControl {
    @IBOutlet weak var flagView: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    
    var currencyCode: String? {
        get {
            return label.text
        }
        set {
            label.text = newValue
            updateFlagView(currencyCode)
        }
    }
    var ammount: String?{
        get {
            return textField.text
        }
        set {
            textField.text = newValue
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
        textField.isUserInteractionEnabled = false
        flagView.isUserInteractionEnabled = false
        label.isUserInteractionEnabled = false
    }
}

private extension CurrencyBox {
    func updateFlagView(_ cc: String?) {
        guard let cc = cc else {
            flagView.image = UIImage(named: "Unknown")
            return
        }
        let countryCode = Locale.countryCode(for: cc).lowercased()
        
        flagView.image = UIImage(named: countryCode) ?? UIImage(named: "Unknown")
    }
}

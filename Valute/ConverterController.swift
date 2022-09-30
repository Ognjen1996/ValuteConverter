//
//  ConverterController.swift
//  Valute
//
//  Created by Uros Andonov on 23.9.22..
//

import UIKit

final class ConverterController: UIViewController {
    
//    @IBOutlet weak private var keypadView: KeypadView!
    
    @IBOutlet weak var leftTextField: UITextField!
    @IBOutlet weak var rightTextField: UITextField!
    @IBOutlet weak var keypadView: KeypadView!
    @IBOutlet weak var sourceCurrencyBox: CurrencyBox!
    @IBOutlet weak var targetCurrencyBox: CurrencyBox!
    
    weak var activeCurrencyBox: CurrencyBox?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        
        // Do any additional setup after loading the view.
        cleanupUI()
        keypadView.delegate = self
        setupInitialState()
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        self.navigationController?.isNavigationBarHidden = false
//    }
    
    func cleanupUI() {
        sourceCurrencyBox.ammount = ""
        targetCurrencyBox.ammount = ""
    }
}

extension ConverterController: KeypadViewDelegate {
    func keypadView(_ keypad: KeypadView, didChangeValue value: String?) {
//        sourceCurrencyBox.ammount = value
        guard let value = value else {
            return
        }
        var value1 = Double(value)
        guard var value1 = value1 else {
            return
        }
        value1 =  value1 * 0.0082
        let converted = String(format: "%.2f", value1)
        sourceCurrencyBox.ammount = value
//        targetCurrencyBox.ammount = converted
    }
}

extension ConverterController: PickerControllerDelegate {
    func pickerController(_ controller: PickerController, didSelectCurrency cc: String) {
        activeCurrencyBox?.currencyCode = cc
    }
}
    
private extension ConverterController {
    
    func changeCurrency(_ sender: CurrencyBox) {
        activeCurrencyBox = sender
        pickCurrency()
    }
    
    func setupInitialState() {
        sourceCurrencyBox.currencyCode = UserDefaults.sourceCC
        targetCurrencyBox.currencyCode = UserDefaults.targetCC
    }
    
    @IBAction func pickCurrency() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "PickerController") as? PickerController {
            vc.delegate = self
            vc.currencies = Locale.commonISOCurrencyCodes
            show(vc, sender: self)
        }
    }
}


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */



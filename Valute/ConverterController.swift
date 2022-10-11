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
    
    
    private var ammount: Double? {
        didSet {
            if !isViewLoaded {return}
            convert()
        }
    }
    private var sourceCurrencyCode: String = UserDefaults.sourceCC
    private var targetCurrencyCode: String = UserDefaults.targetCC
    
    private var rate: Double? {
        didSet {
            if !isViewLoaded {return}
            convert()
        }
    }
    
    
    weak var activeCurrencyBox: CurrencyBox?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        
        // Do any additional setup after loading the view.
        cleanupUI()
        keypadView.delegate = self
        setupInitialState()
        
        fetchRate()
        convert()
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
//        guard let value = value else {
//            return
//        }
//        var value1 = Double(value)
//        guard var value1 = value1 else {
//            return
//        }
//        value1 =  value1 * 0.0082
//        let converted = String(format: "%.2f", value1)
        sourceCurrencyBox.ammount = value
        ammount = keypad.ammount
    }
}

extension ConverterController: PickerControllerDelegate {
    func pickerController(_ controller: PickerController, didSelectCurrency cc: String) {
        activeCurrencyBox?.currencyCode = cc
        
        navigationController?.popViewController(animated: true)
        fetchRate()
    }
}
    
private extension ConverterController {
    
    @IBAction func changeCurrency(_ sender: CurrencyBox) {
        activeCurrencyBox = sender
        pickCurrency()
    }
    
    func setupInitialState() {
        sourceCurrencyBox.currencyCode = sourceCurrencyCode
        targetCurrencyBox.currencyCode = targetCurrencyCode
    }
    
    @IBAction func pickCurrency() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "PickerController") as? PickerController {
            vc.delegate = self
            vc.currencies = Locale.commonISOCurrencyCodes
            show(vc, sender: self)
            
        }
    }
    func convert() {
        guard
            let ammount = ammount,
            let rate = rate
        else{
            targetCurrencyBox.ammount = ""
            return
        }
        let res = ammount * rate
        targetCurrencyBox.ammount = String(format: "%.2f", res)
        
    }
    
    func fetchRate() {
        ExchangeManager.shared.rate(targetCC: targetCurrencyCode, sourceCC: sourceCurrencyCode) {
            [weak self] r, error in
            
            if let error = error as? ExchangeError {
                
                switch error {
                case .fetchingRates:
                    break
                case .missingRates:
                    break
                }
                return
            }
            self?.rate = r
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



//
//  ConverterController.swift
//  Valute
//
//  Created by Uros Andonov on 23.9.22..
//

import UIKit

final class ConverterController: UIViewController {
    
//    @IBOutlet weak private var keypadView: KeypadView!
    
    @IBOutlet weak var leftCurrencyBox: CurrencyBox!
    @IBOutlet weak var rightCurrencyBox: CurrencyBox!
    @IBOutlet weak var keypadView: KeypadView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        // Do any additional setup after loading the view.
        keypadView.delegate = self
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        self.navigationController?.isNavigationBarHidden = false
//    }
}

extension ConverterController: KeypadViewDelegate {
    func keypadView(_ keypad: KeypadView, didChangeValue value: String?) {
        leftCurrencyBox.textField.text = value
    }
}
    
private extension ConverterController{
    @IBAction func pickCurrency() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "PickerController")
        
        show(vc, sender: self)
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



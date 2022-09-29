//
//  PickerController.swift
//  Valute
//
//  Created by Uros Andonov on 26.9.22..
//

import UIKit

protocol PickerControllerDelegate: class {
    func pickerController(_ controller: PickerController, didSelectCurrency cc: String)
}

final class PickerController: UIViewController {
    
    var currencies: [String] = [] {
        didSet{
            
        }
    }
    weak var delegate: PickerControllerDelegate?
}
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */



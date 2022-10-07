//
//  PickerCell.swift
//  Valute
//
//  Created by Uros Andonov on 30.9.22..
//

import UIKit

final class PickerCell: UITableViewCell {

    @IBOutlet private weak var label: UILabel!
    @IBOutlet private weak var flagView: UIImageView!
    
    override func awakeFromNib() {
        label.textColor = .white
        
    }
    
}

extension PickerCell {
    func populateCell(with currencyCode: String) {
        label.text = currencyCode
        updateFlagView(currencyCode)
        
    }
    
    private func updateFlagView(_ cc: String?) {
        guard let cc = cc else {
            flagView.image = UIImage(named: "Unknown")
            return
        }
        let countryCode = Locale.countryCode(for: cc).lowercased()
        flagView.image = UIImage(named: countryCode) ?? UIImage(named: "Unknown")
        
    }
    
}

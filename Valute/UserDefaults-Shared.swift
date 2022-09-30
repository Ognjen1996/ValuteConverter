//
//  UserDefaults-Shared.swift
//  Valute
//
//  Created by Uros Andonov on 30.9.22..
//

import Foundation
import UIKit


extension UserDefaults {
    private enum Key: String {
        case sourceCC = "SourceCurrencyCode"
        case targetCC = "TargetCurrencyCode"
        case lasAmmount = "LastAmmount"
    }
    static var sourceCC: String {
        get {
            let defs = UserDefaults.standard
            return defs.string(forKey: Key.sourceCC.rawValue) ?? "RSD"
        }
        set(value) {
            let defs = UserDefaults.standard
            defs.string(forKey: Key.sourceCC.rawValue)
        }
    }
    
    static var targetCC: String {
        get {
            let defs = UserDefaults.standard
            return defs.string(forKey: Key.targetCC.rawValue) ?? "USD"
        }
        set(value) {
            let defs = UserDefaults.standard
            defs.string(forKey: Key.targetCC.rawValue)
        }
    }
}

extension UITableViewCell{
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

//
//  Locale-Extensions.swift
//  Valute
//
//  Created by Uros Andonov on 30.9.22..
//

import Foundation

extension Locale {
    static func countryCode(for currencyCode: String) -> String {
        let cc = currencyCode.uppercased()
        
        switch cc {
        case "EUR":
            return "eu"
        case "USD":
            return "us"
        case "CAD":
            return "ca"
        case "AUD":
            return "au"
        case "GBP":
            return "gb"
        default:
            break
        }
        
        for rc in Locale.isoRegionCodes {
            let comps = [NSLocale.Key.countryCode.rawValue: rc]
            
            let localeIndentified = Locale.identifier(fromComponents: comps)
            let locale = Locale(identifier: localeIndentified)
            
            guard let localeCurrencyCode = locale.currencyCode else {
                continue
            }
            if currencyCode == localeCurrencyCode {
                return rc
            }
        }
        return "Unknown"
    }
}

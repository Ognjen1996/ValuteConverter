//
//  ExchangeManager.swift
//  Valute
//
//  Created by Uros Andonov on 7.10.22..
//

import Foundation

final class ExchangeManager {
    static let shared = ExchangeManager()
    private init() {
    }
    
    func rate(targetCC: String, sourceCC: String, callback: (Double?) -> Void) {
      
        
        callback(nil)
    }
    
}

//
//  ExchangeError.swift
//  Valute
//
//  Created by Uros Andonov on 11.10.22..
//

import Foundation


enum ExchangeError: Error {
    case fetchingRates
    case missingRates
}
